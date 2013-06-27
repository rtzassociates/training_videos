class CommentsController < ApplicationController
  authorize_resource
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if params[:comment][:content].present?
      @comment.save!
      flash[:notice] = "Thanks for your comment!"
      CommentMailer.comment_email(@comment).deliver
    else
      flash[:notice] = "Thanks for viewing!"
    end
    Viewing.find(params[:comment][:viewing_id]).complete_viewing!
    redirect_to site_training_sessions_path
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to training_session_path(@comment.training_session), :notice => "Comment deleted"
  end
end
