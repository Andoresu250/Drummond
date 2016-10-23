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
      @workers = Worker.all
  end

  def create
      @workers = Worker.all
      @user = User.new(user_params)
      puts "---------------------------------------------"    
      puts worker_id_params
      puts worker_params
      

      if have_worker_id
        @worker = Worker.new(worker_params)
        if @worker.save
          @user.worker = @worker
          if @user.save
            redirect_to users_admin_index_path, notice: "Usuario creado satisfactoriamente" 
          else
              Worker.find(@worker.id).destroy   
              render :new                     
          end  
        else        
          render :new
        end      
      else
        puts "Esta vacio los params"
        puts worker_id_params
        puts "id:"
        puts worker_id_params[:id]
        @worker = Worker.find(worker_id_params[:id].to_i)
        @user.worker = @worker
        if @user.save
          redirect_to users_admin_index_path, notice: "Usuario creado satisfactoriamente" 
        else
            render :new                     
        end  
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
  
  def worker_id_params
    params.require(:worker).permit(:id)
  end
  
  def have_worker_id
     worker_id_params[:id] == ""
  end
end