class Site < ActiveRecord::Base
  attr_accessible :name, :subdomain, :banner_image
  
  has_one :style_setting
  
  mount_uploader :banner_image, ImageUploader
end
