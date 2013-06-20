class VideosController < ApplicationController
  
  authorize_resource
  
  def index
    redirect_to new_viewer_url if current_viewer.nil?
    @videos = Video.order("id ASC").page(params[:page]).per_page(10)
  end
  
  def show
    @video = Video.find(params[:id])
    @favoriteable = @video
    @favorite = current_user.favorite_for(@video) if current_user
    View.create(:user_id => logged_in? ? current_user.id : nil, 
                :viewable_id => @video.id, 
                :viewable_type => @video.class.to_s)
    @comment = Comment.new
  end

  def new
    @video = Video.new
  end
  
  def edit
    @video = Video.find(params[:id])
  end
  
  def update
    @video = Video.find(params[:id])
    @video.update_attributes(params[:video])
    @video.save
    redirect_to @video, :notice => "Your video has been successfully updated"
  end

  def create
    @video = Video.new(params[:video])
    @video.user_id = current_user.id
    if @video.save
      redirect_to videos_path, :notice => "Your video has been successfully created"
    else
      render 'new'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = "Your video has been successfully deleted"
    redirect_to videos_path
  end
  
  def favorites
    @videos = current_user.favorite_videos.order("id DESC").page(params[:page]).per_page(50)
  end
  
end