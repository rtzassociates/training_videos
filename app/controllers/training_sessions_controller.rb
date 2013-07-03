class TrainingSessionsController < ApplicationController
  include SitesHelper
  authorize_resource
  
  before_filter :viewing_required, :only => [:show]
  
  def index
    if params[:order] == "asc"
      @training_sessions = TrainingSession.order("created_at ASC")
    else
      @training_sessions = TrainingSession.order("created_at DESC")
    end
    @training_sessions = @training_sessions.page(params[:page]).per_page(25)
    authorize! :manage, @training_sessions
  end
  
  def show
    @training_session = TrainingSession.find(params[:id])
    site_can_view?(@training_session)
    if params[:viewing_id].present?
      @viewing = Viewing.find(params[:viewing_id])
    end
    @viewings = @training_session.viewings.order('id DESC').page(params[:page]).per_page(10)
    @comments = @training_session.comments.order('id DESC').page(params[:page]).per_page(5)
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
  
  private
  
  def viewing_required
    unless current_user.admin?
      redirect_to(root_url, :notice => "Choose a training session to begin a viewing") unless params[:viewing_id]
    end
  end
  
end