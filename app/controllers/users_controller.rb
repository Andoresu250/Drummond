class UsersController < ApplicationController
  
  before_filter :authenticate_user!

  def index
        @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
      @user = User.new
      @worker = Worker.new
  end

  def create
      @user = User.new(user_params)
      puts "---------------------------------------------"      
      @worker = Worker.new(worker_params)
      if @worker.save
        @user.worker = worker
        if @user.save
          redirect_to users_admin_index_path, notice: "Usuario creado satisfactoriamente" 
        else
            Worker.find(@worker.id).destroy   
            render :new                     
        end  
      else        
        render :new
      end      
  end

  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params_edit_pass)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params_edit_pass    
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:email, :name, :last_name, :password, :password_confirmation)
  end

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :cc, :code)
  end
end