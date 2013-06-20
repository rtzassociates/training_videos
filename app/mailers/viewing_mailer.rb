class ViewingMailer < ActionMailer::Base
  default from: "TrainingLACSS@getcare.com"
  
  def viewing_receipt(viewing, email)
    @viewing = viewing
    unless @viewing.video.pdf.blank?
      attachments["#{viewing.video.pdf.to_s.split("/").last}"] = File.read("#{Rails.root}/public/#{viewing.video.pdf_url}")
    end
    subject = "Confirmation of GetCare #{viewing.video.name} training session"
    mail(:to => email, :subject => subject)
  end
  
end
