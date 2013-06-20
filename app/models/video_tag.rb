class VideoTag < ActiveRecord::Base
  attr_accessible :video_id, :tag_id

  belongs_to :video
  belongs_to :tag
end
