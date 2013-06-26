class Site < ActiveRecord::Base
  attr_accessible :name, :subdomain, :banner_image
  
  has_one :style_setting
  has_one :site_content
  
  mount_uploader :banner_image, ImageUploader
end
