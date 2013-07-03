class Comment < ActiveRecord::Base
  attr_accessible :content, :viewer_id, :viewing_id, :training_session_id, :site_id
  
  belongs_to :training_session
  belongs_to :viewer
  belongs_to :site
  
  validates :site_id, :presence => true
  validates :training_session_id, :presence => true
  validates :viewer_id, :presence => true
  validates :viewing_id, :presence => true
end
