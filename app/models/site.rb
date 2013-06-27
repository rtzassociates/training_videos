class Site < ActiveRecord::Base
  attr_accessible :name, :subdomain, :banner_image
  
  has_one :style_setting, :dependent => :destroy
  has_one :site_content, :dependent => :destroy
  
  has_many :users
  has_many :site_training_sessions
  has_many :training_sessions, :through => :site_training_sessions
  
  mount_uploader :banner_image, ImageUploader
  
  def can_view?(training_session)
    site_training_sessions.where(:site_id => self.id, :training_session_id => training_session.id).any?
  end
end
