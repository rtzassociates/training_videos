class ViewingsController < ApplicationController
  authorize_resource
  
  before_filter :check_for_training_session_id, :only => [:new]
  
  def new
    @viewing = Viewing.new
    @training_session = TrainingSession.find(params[:training_session_id])
  end
  
  def create
    @viewing = Viewing.new(params[:viewing])
    if @viewing.save
      ViewingMailer.viewing_receipt(@viewing, current_viewer.email).deliver
      ViewingMailer.viewing_receipt(@viewing, "traininglacss@getcare.com").deliver
      redirect_to training_session_path(@viewing.training_session, :viewing_id => @viewing.id)
    else
      render 'new'
    end
  end
  
  def destroy
    @viewing = Viewing.find(params[:id])
    @viewing.destroy
    redirect_to training_session_path(@viewing.training_session)
  end
  
  private
  
  def check_for_training_session_id
    redirect_to training_sessions_path unless params[:training_session_id]
  end
  
end
