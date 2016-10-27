class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    @report.group_id = current_user.worker.groups.find_by(current: true).id  unless current_user.worker.groups.where(current: true).empty?
    @current_groups = Group.where(current: true)
    @shifts = ["Diurno", "Nocturno"]
    @equipments = Equipment.all
    @vehicles = Vehicle.all
    @vehicle_statuses = ["down", "ok", "r"]
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "----------------------------------------"
    @report.observations = observations_params_to_object
    @report.tasks = taks_params_to_object
    raise params.yml
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:shift, :date, :group_id)
    end

    def observations_params
      params.require(:observations).permit(:down => [:hour => [], :minutes => []], :ready => [:hour => [], :minutes => []],:comments => [], :equipments => [])
    end

    def taks_params
      params.require(:tasks).permit(:comments => [], :equipments => [])
    end

    def observations_params_to_object
      observations = Array.new(observations_params[:equipments].size) {Hash.new}
      #observations_params[:down][:hour].each_with_index { |h, index| observations.push({:}) }
      observations_params[:equipments].each_with_index { |e, index| observations[index].merge!({:equipment_id => e}) }
      observations_params[:comments].each_with_index { |c, index| observations[index].merge!({:comment => c}) }
      observations_params[:down][:hour].each_with_index { |d, index| observations[index].merge!({:down => (d.empty? || observations_params[:down][:minutes][index].empty?) ? (nil) : (d + ":" + observations_params[:down][:minutes][index]) }) }
      observations_params[:ready][:hour].each_with_index { |r, index| observations[index].merge!({:ready => (r.empty? || observations_params[:ready][:minutes][index].empty?) ? (nil) : (r + ":" + observations_params[:ready][:minutes][index]) }) }
      observations
    end

    def taks_params_to_object
      tasks = Array.new (taks_params[:equipments].size) {Hash.new}
      taks_params[:equipments].each_with_index { |e, index| tasks[index].merge!({:equipment_id => e}) }
      taks_params[:comments].each_with_index { |c, index| tasks[index].merge!({:comment => c}) }
      tasks
    end
end
