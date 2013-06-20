class Viewing < ActiveRecord::Base
  attr_accessible :participants, :viewer_id, :training_session_id
  
  belongs_to :training_session
  belongs_to :viewer
  
  validates :viewer_id, :presence => true
  validates :training_session_id, :presence => true
end
