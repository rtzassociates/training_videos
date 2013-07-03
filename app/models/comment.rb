class Comment < ActiveRecord::Base
  attr_accessible :content, :viewer_id, :viewing_id, :training_session_id, :site_id
  
  belongs_to :training_session
  belongs_to :viewer
  belongs_to :site
end
