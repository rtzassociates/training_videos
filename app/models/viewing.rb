class Viewing < ActiveRecord::Base
  attr_accessible :participants, :viewer_id, :video_id
  
  belongs_to :video
  belongs_to :viewer
end
