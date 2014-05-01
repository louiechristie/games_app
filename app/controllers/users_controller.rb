class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    if current_user && current_user.role == "admin"
      @users = User.all
      @users = @users.sort_by{|user| total_score(user)}.reverse!
    else
      @users = User.where(role: "user")
      @users = @users.sort_by{|user| total_score(user)}.reverse!
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(params[:user])
    if @user.save
      if current_user && current_user.role == "admin"
        redirect_to users_path
      else
       session[:user_id] = @user.id

        redirect_to root_path, notice: "Registered and logged in."      
      end
    else
     render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to(user_path)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to games_path
  end

end