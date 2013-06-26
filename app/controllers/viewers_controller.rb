class ViewersController < ApplicationController
  authorize_resource
  
  def index
    @viewer = Viewer.order("name ASC")
  end
  
  def show
    @viewer = Viewer.find(params[:id])
    @viewings = @viewer.viewings.order("created_at DESC")
  end
  
  def new
    @viewer = Viewer.new
  end
  
  def create  
    @viewer = Viewer.find_by_email(params[:viewer][:email])
    if @viewer
      @viewer.update_attributes!(params[:viewer])
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
  
  def edit
    @viewer = Viewer.find(params[:id])
  end
  
  def update
    @viewer = Viewer.find(params[:id])
    if @viewer.update_attributes(params[:viewer])
      redirect_to @viewer, :notice => "Viewer updated successfully"
    else
      render 'edit'
    end
  end
  
  def destroy
    @viewer = Viewer.find(params[:id])
    @viewer.destroy
    redirect_to @viewer.user, :notice => "Viewer deleted successfully"
  end
  
end