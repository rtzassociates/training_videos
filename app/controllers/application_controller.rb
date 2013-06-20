class ApplicationController < ActionController::Base
  protect_from_forgery
  include ControllerAuthentication
  include ViewersHelper
  
  check_authorization
  
  before_filter :login_required
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
end
