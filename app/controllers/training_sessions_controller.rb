class TrainingSessionsController < ApplicationController
  
  authorize_resource
  
  before_filter :viewer_required
  
  def index
    if params[:order] == "desc"
      @training_sessions = TrainingSession.order("created_at DESC").page(params[:page]).per_page(25)
    elsif params[:order] == "asc"
      @training_sessions = TrainingSession.order("created_at ASC").page(params[:page]).per_page(25)
    else
      @training_sessions = TrainingSession.order("position").page(params[:page]).per_page(25)
    end
  end
  
  def show
    @training_session = TrainingSession.find(params[:id])
    @comment = Comment.new
  end

  def new
    @training_session = TrainingSession.new
  end
  
  def edit
    @training_session = TrainingSession.find(params[:id])
  end
  
  def update
    @training_session = TrainingSession.find(params[:id])
    @training_session.update_attributes(params[:training_session])
    @training_session.save
    redirect_to @training_session, :notice => "Your training session has been successfully updated"
  end

  def create
    @training_session = TrainingSession.new(params[:training_session])
    @training_session.user_id = current_user.id
    if @training_session.save
      redirect_to training_sessions_path, :notice => "Your training session has been successfully created"
    else
      render 'new'
    end
  end

  def destroy
    @training_session = TrainingSession.find(params[:id])
    @training_session.destroy
    flash[:notice] = "Your training session has been successfully deleted"
    redirect_to training_sessions_path
  end
  
  def order
    @training_sessions = TrainingSession.order("position")
  end
  
  def sort
    params[:training_session].each_with_index do |id, index|
      TrainingSession.update_all({position: index+1}, {id: id})
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