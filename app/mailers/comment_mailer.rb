class CommentMailer < ActionMailer::Base
  default from: "TrainingLACSS@getcare.com"
  
  def comment_email(comment)
    @comment = comment
    subject = "Comment for #{comment.video.name} by #{comment.viewer.name}"
    mail(:to => "TrainingLACSS@getcare.com", :subject => subject)
  end
  
end
