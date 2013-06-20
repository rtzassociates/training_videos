class CommentsController < ApplicationController
  authorize_resource
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      if @comment.content.present?
        flash[:notice] = "Thanks for your comment!"
        CommentMailer.comment_email(@comment).deliver
      else
        flash[:notice] = "Thanks for viewing!"
      end
      redirect_to videos_path
    end
  end
end
