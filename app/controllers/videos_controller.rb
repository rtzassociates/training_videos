class VideosController < ApplicationController
  
  authorize_resource
  
  before_filter :viewer_required
  
  def index
    @videos = Video.order("position").page(params[:page]).per_page(25)
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
  
  def order
    @videos = Video.order("position")
  end
  
  def sort
    params[:video].each_with_index do |id, index|
      Video.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  
  private
  
  def viewer_required
    unless current_user.admin?
      redirect_to new_viewer_url if current_viewer.nil?
    end
  end
  
end