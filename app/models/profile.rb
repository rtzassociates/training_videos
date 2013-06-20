class Profile < ActiveRecord::Base
  attr_accessible :image, :name, :user_id
  
  belongs_to :user
  mount_uploader :image, ImageUploader
end
