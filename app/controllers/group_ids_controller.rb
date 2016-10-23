class GroupIdsController < ApplicationController
  before_action :set_group_id, only: [:show, :edit, :update, :destroy]

  # GET /group_ids
  # GET /group_ids.json
  def index
    @group_ids = GroupId.all
  end

  # GET /group_ids/1
  # GET /group_ids/1.json
  def show
  end

  # GET /group_ids/new
  def new
    @group_id = GroupId.new
  end

  # GET /group_ids/1/edit
  def edit
  end

  # POST /group_ids
  # POST /group_ids.json
  def create
    @group_id = GroupId.new(group_id_params)

    respond_to do |format|
      if @group_id.save
        format.html { redirect_to @group_id, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group_id }
      else
        format.html { render :new }
        format.json { render json: @group_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_ids/1
  # PATCH/PUT /group_ids/1.json
  def update
    respond_to do |format|
      if @group_id.update(group_id_params)
        format.html { redirect_to @group_id, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_id }
      else
        format.html { render :edit }
        format.json { render json: @group_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_ids/1
  # DELETE /group_ids/1.json
  def destroy
    @group_id.destroy
    respond_to do |format|
      format.html { redirect_to group_ids_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_id
      @group_id = GroupId.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_id_params
      params.require(:group_id).permit(:name)
    end
end
