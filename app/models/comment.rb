class Comment < ActiveRecord::Base
  attr_accessible :content, :viewer_id, :video_id
  
  belongs_to :video
  belongs_to :viewer
end
