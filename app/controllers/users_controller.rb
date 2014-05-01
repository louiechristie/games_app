class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    if current_user && current_user.role == "admin"
      @users = User.all
    else
      @users = User.where(role: "user")
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
        redirect_to new_session_path 
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

end