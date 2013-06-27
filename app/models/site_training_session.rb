class SiteTrainingSession < ActiveRecord::Base
  attr_accessible :site_id, :training_session_id, :position
  
  belongs_to :site
  belongs_to :training_session
  
end
