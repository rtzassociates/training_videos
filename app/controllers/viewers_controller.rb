class ViewersController < ApplicationController
  authorize_resource
  
  def new
    @viewer = Viewer.new
  end
  
  def create
    @viewer = Viewer.new(params[:viewer])
    if @viewer.save
      cookies[:viewer_id] = @viewer.id
      redirect_to training_sessions_path
    else
      render 'new'
    end
  end
end