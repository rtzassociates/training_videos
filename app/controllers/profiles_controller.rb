class ProfilesController < ApplicationController

  def create
    @profile = Profile.new(params[:profile])
    @profile.user_id = current_user.id
    authorize! :manage, @profile
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = Profile.find_by_user_id(params[:user_id])
    authorize! :magage, @profile
  end

  def update
    @profile = Profile.find_by_user_id(params[:user_id])
    authorize! :manage, @profile
    if @profile.update_attributes(params[:profile])
      redirect_to @profile.user, :notice => "Profile was successfully updated"
    else
      render :action => 'edit'
    end
  end
  
end