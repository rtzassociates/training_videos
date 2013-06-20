class CommentsController < ApplicationController
  authorize_resource
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      CommentMailer.comment_email(@comment).deliver
      redirect_to videos_path, :notice => "Thanks for your comment!"
    else
      flash[:error] = "Comment can't be blank"
      redirect_to @comment.video
    end
  end
end
