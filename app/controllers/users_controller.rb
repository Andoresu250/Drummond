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
  end

  def create
      @user = User.new(user_params)
      puts "---------------------------------------------"
      puts user_params
      puts @user.name
      puts @user.last_name
      puts @user.email
      puts @user.permission_level
      if @user.save
          redirect_to users_admin_index_path, notice: "Usuario creado satisfactoriamente" 
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
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:email, :name, :last_name, :password, :password_confirmation)
  end
end