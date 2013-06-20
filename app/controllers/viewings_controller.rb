class ViewingsController < ApplicationController
  authorize_resource
  
  before_filter :check_for_video_id, :only => [:new]
  
  def new
    @viewing = Viewing.new
    @video = Video.find(params[:video_id])
  end
  
  def create
    @viewing = Viewing.new(params[:viewing])
    if @viewing.save
      ViewingMailer.viewing_receipt(@viewing, current_viewer.email).deliver
      ViewingMailer.viewing_receipt(@viewing, "traininglacss@getcare.com").deliver
      redirect_to @viewing.video
    else
      render 'new'
    end
  end
  
  private
  
  def check_for_video_id
    redirect_to videos_path unless params[:video_id]
  end
  
end
