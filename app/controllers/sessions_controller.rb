class SessionsController < ApplicationController
  include SessionsHelper
  skip_before_filter :login_required, :only => [ :new, :create ]
  skip_before_filter :viewer_required
  skip_authorization_check
  
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user && ( user.site == current_site || user.admin? )
      login user  
      redirect_to root_url, :notice => "Logged in successfully"
    else
      flash.now[:error] = "Invalid login or password"
      render :action => 'new'
    end
  end

  def destroy
    cookies.delete(:token)
    cookies.delete(:viewer_id)
    redirect_to login_url, :notice => "You have been logged out"
  end
end