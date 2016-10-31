class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :set_current]
  before_action :authenticate_user!
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.where(current: false)
    @current_groups = Group.where(current: true)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
    @group_ids = GroupId.all
    @workers = Worker.where.not(code: 0, cc: 0, status: "despedido")
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.current = true;
    @group.workers = workers_params[:list]

#=begin
    respond_to do |format|
      if @group.save
        change_current
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
#=end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  #TODO: quitar update
  def update
    respond_to do |format|
      if @group.update(group_params)
        change_current
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  # TODO: quitar destroy
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current
    respond_to do |format|
      if @group.update({current: true})
        change_current
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:group_id_id)
    end

    def workers_params
      params.require(:group).permit(:list => [])
    end

    def change_current
      groups = Group.where(group_id_id: @group.group_id_id)
      groups.each do |group|
        if group != @group
          group.current = false
          group.save!
        end
      end
    end
end
