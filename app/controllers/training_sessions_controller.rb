class TrainingSessionsController < ApplicationController
  
  authorize_resource
    
  def index
    redirect_to(root_url, :alert => "You are not authorized to access this page.") unless current_user.admin?
    if params[:order] == "asc"
      @training_sessions = TrainingSession.order("created_at ASC").page(params[:page]).per_page(25)
    else
      @training_sessions = TrainingSession.order("created_at DESC").page(params[:page]).per_page(25)
    end
  end
  
  def show
    @training_session = TrainingSession.find(params[:id])
    redirect_to(root_url, :alert => "You are not authorized to access this page.") unless (current_site.can_view?(@training_session) || current_user.admin?)
    if params[:viewing_id].present?
      @viewing = Viewing.find(params[:viewing_id])
    end
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
      redirect_to @training_session, :notice => "Your training session has been successfully created"
    else
      render 'new'
    end
  end

  def destroy
    @training_session = TrainingSession.find(params[:id])
    @training_session.destroy
    flash[:notice] = "Your training session has been successfully deleted"
    redirect_to training_library_path
  end
  
end