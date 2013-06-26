class Site < ActiveRecord::Base
  attr_accessible :name, :subdomain, :banner_image
  
  has_one :style_setting, :dependent => :destroy
  has_one :site_content, :dependent => :destroy
  
  mount_uploader :banner_image, ImageUploader
end
