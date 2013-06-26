class SiteContent < ActiveRecord::Base
  attr_accessible :footer_text, :site_id, :training_session_greeting
  
  belongs_to :site
end
