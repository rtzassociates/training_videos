class ViewersController < ApplicationController
  authorize_resource
  
  def new
    @viewer = Viewer.new
  end
  
  def create  
    @viewer = Viewer.find_by_email(params[:viewer][:email])
    if @viewer
      store_viewer @viewer
    else
      @viewer = Viewer.new(params[:viewer])
      if @viewer.save
        store_viewer @viewer
      else
        render 'new'
      end
    end
  end
  
end