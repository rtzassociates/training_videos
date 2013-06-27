class SiteTrainingSessionsController < ApplicationController
  authorize_resource
  
  before_filter :viewer_required, :only => [:index]
  
  def index
    if params[:order] == "desc"
      @training_sessions = current_site.training_sessions.order("created_at DESC").page(params[:page]).per_page(25)
    elsif params[:order] == "asc"
      @training_sessions = current_site.training_sessions.order("created_at ASC").page(params[:page]).per_page(25)
    else
      @training_sessions = current_site.training_sessions.order("site_training_sessions.position ASC").page(params[:page]).per_page(25)
    end
  end
  
  def create
    @site_training_session = SiteTrainingSession.new(params[:site_training_session])
    @site_training_session.site_id = current_site.id
    @site_training_session.save
    respond_to do |format|
      format.html { redirect_to site_training_sessions_path,
                    :notice => "Training session successfully published to site." }
      format.js
    end
  end
  
  def destroy
    @site_training_session = SiteTrainingSession.find_by_training_session_id_and_site_id(params[:site_training_session][:training_session_id], params[:site_training_session][:site_id])
    @site_training_session.destroy
    respond_to do |format|
      format.html { redirect_to site_training_sessions_path,
                    :notice => "Training session successfully removed from site." }
      format.js
    end
  end
  
  def order
    @site_training_sessions = current_site.training_sessions.order("site_training_sessions.position ASC")
  end
  
  def sort
    params[:training_session].each_with_index do |id, index|
      SiteTrainingSession.update_all({position: index+1}, {training_session_id: id, site_id: current_site.id})
    end
    flash[:notice] = "Training sessions reordered successfully."
    render nothing: true
  end
  
  private
  
  def viewer_required
    unless current_user.admin?
      redirect_to new_viewer_url if current_viewer.nil?
    end
  end
  
end