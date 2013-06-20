class UsersController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :create]
  authorize_resource
  include SessionsHelper
  
  def index
    @users = User.page(params[:page]).per_page(50)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user.create_profile
      login @user
      redirect_to users_path, :notice => "Your account was successfully created"
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => "Your account was successfully updated"
    else
      render :action => 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :notice => "Account deleted"
  end
end