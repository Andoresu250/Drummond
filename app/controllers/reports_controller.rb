class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy, :isabsent?]
  before_action :load_references, only: [:new, :edit]
  before_action :authenticate_user!
  helper_method :isabsent?
  # GET /reports
  # GET /reports.json
  def index
    @my_reports = Report.where(created_by: current_user.worker.id)
    @reports = Report.all
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'reports/pdf', pdf: 'pdf'}
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'reports/report', pdf: 'report'}
    end
  end

  # GET /reports/new
  def new
    @report = Report.new

  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    
    @report = Report.new(report_params)
    @report.created_by = current_user.worker
    @report.observations = observations_params_to_object
    @report.tasks = taks_params_to_object
    @report.shots = shots_params_to_object
    @report.vehicle_statuses = vehicle_statuses_params_to_object
    @report.absences = absences_params_to_object
    #raise params.yml
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    @report.observations = observations_params_to_object
    @report.tasks = taks_params_to_object
    @report.shots = shots_params_to_object
    @report.vehicle_statuses = vehicle_statuses_params_to_object
    respond_to do |format|

      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    #@report.destroy_observations
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def isabsent?(worker)
    @report.absences.each do |absences|
      return true if absences.worker == worker
    end
    return false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    def load_references
      @report.group_id = current_user.worker.groups.find_by(current: true).id  unless current_user.worker.groups.where(current: true).empty?
      @current_groups = Group.where(current: true)
      @shifts = ["Diurno", "Nocturno"]
      @equipments = Equipment.order(:reference)
      @vehicles = Vehicle.all
      @vehicle_statuses = ["down", "ok", "r"]
      @sups = User.all.where.not(email: "admin@admin.com")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:shift, :date, :group_id, :senior_id, :junior_id, :incident, :incident_comment)
    end

    def observations_params
      params.merge!({:observations => { :down => { :hour => [], :minutes => [] }, :ready => { :hour => [], :minutes => [] }, :comments => [], :equipments => [], :main => [], :causes => [] }}) unless params.has_key?(:observations)
      params.require(:observations).permit(:down => [:hour => [], :minutes => []], :ready => [:hour => [], :minutes => []],:comments => [], :equipments => [], :main => [], :causes => [])
    end

    def taks_params
      params.merge!({:tasks => {:comments => [], :equipments => []}}) unless params.has_key?(:tasks)
      params.require(:tasks).permit(:comments => [], :equipments => [])
    end

    def shots_params
      params.merge!({:shots => {:comments => []}}) unless params.has_key?(:shots)
      params.require(:shots).permit(:comments => [])
    end

    def vehicle_statuses_params
      params.merge!({:vehicles => {:ids => [], :status => [], :location => []}}) unless params.has_key?(:vehicles)
      params.require(:vehicles).permit(:ids => [], :status => [], :location => [])
    end

    def absences_params
      params.merge!({:absences => {:ids => [], :comments => []}}) unless params.has_key?(:absences)
      params.require(:absences).permit(:comments => [], :ids => [])
    end

    def observations_params_to_object
      observations = Array.new(observations_params[:equipments].size) {Hash.new}
      observations_params[:equipments].each_with_index { |e, index| observations[index].merge!({:equipment_id => e}) }
      observations_params[:comments].each_with_index { |c, index| observations[index].merge!({:comment => c}) }
      observations_params[:main].each_with_index { |c, index| observations[index].merge!({:main_problem => c.gsub('-', ' ')}) }
      observations_params[:causes].each_with_index { |c, index| observations[index].merge!({:cause => c.gsub('-', ' ')}) }
      observations_params[:down][:hour].each_with_index { |d, index| observations[index].merge!({:down => (d.empty? || observations_params[:down][:minutes][index].empty?) ? (nil) : (d.to_s + ":" + observations_params[:down][:minutes][index].to_s) }) }
      observations_params[:ready][:hour].each_with_index { |r, index| observations[index].merge!({:ready => (r.empty? || observations_params[:ready][:minutes][index].empty?) ? (nil) : (r.to_s + ":" + observations_params[:ready][:minutes][index].to_s) }) }
      observations
    end

    def taks_params_to_object
      tasks = Array.new (taks_params[:equipments].size) {Hash.new}
      taks_params[:equipments].each_with_index { |e, index| tasks[index].merge!({:equipment_id => e}) }
      taks_params[:comments].each_with_index { |c, index| tasks[index].merge!({:comment => c}) }
      tasks
    end

    def shots_params_to_object
      shots = Array.new (shots_params[:comments].size) {Hash.new}
      shots_params[:comments].each_with_index { |c, index| shots[index].merge!({:comment => c}) }
      shots
    end

    def vehicle_statuses_params_to_object
      vehicles = Array.new (vehicle_statuses_params[:ids].size) {Hash.new}
      vehicle_statuses_params[:ids].each_with_index { |id, index| vehicles[index].merge!({:vehicle_id => id}) }
      vehicle_statuses_params[:status].each_with_index { |status, index| vehicles[index].merge!({:status => status}) }
      vehicle_statuses_params[:location].each_with_index { |location, index| vehicles[index].merge!({:location => location}) }
      vehicles
    end

    def absences_params_to_object
      absences = Array.new (absences_params[:ids].size) {Hash.new}
      absences_params[:ids].each_with_index { |id, index| absences[index].merge!({:worker_id => id}) }
      absences_params[:comments].each_with_index { |c, index| absences[index].merge!({:comment => c}) }
      absences
    end
end
