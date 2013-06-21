class ViewingMailer < ActionMailer::Base
  default from: "TrainingLACSS@getcare.com"
  
  def viewing_receipt(viewing, email)
    @viewing = viewing
    unless @viewing.training_session.pdf.blank?
      attachments["#{viewing.training_session.pdf.to_s.split("/").last}"] = File.read("#{Rails.root}/public/#{viewing.training_session.pdf_url}")
    end
    subject = "Confirmation of GetCare #{viewing.training_session.name} training session"
    mail(:to => email, :subject => subject)
  end
  
end
