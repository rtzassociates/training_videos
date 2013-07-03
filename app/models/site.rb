class Site < ActiveRecord::Base
  attr_accessible :name, :subdomain, :banner_image
  
  has_one :style_setting, :dependent => :destroy
  has_one :site_content, :dependent => :destroy
  
  has_many :users
  has_many :site_training_sessions
  has_many :training_sessions, :through => :site_training_sessions
  has_many :viewings
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  validates_presence_of :subdomain
  validates_uniqueness_of :subdomain
  validates_format_of :subdomain, :with => /^[a-z\d]+(-[a-z\d]+)*$/i
  
  mount_uploader :banner_image, ImageUploader
  
  def can_view?(training_session)
    site_training_sessions.where(:site_id => self.id, :training_session_id => training_session.id).any?
  end
  
  def banner_image_name
    self.banner_image.to_s.split("/").last
  end
  
  def viewings_for(training_session)
    training_session.viewings.joins(:site).where("viewings.site_id = ?", self.id)
  end
  
  def comments_for(training_session)
    training_session.comments.joins(:site).where("comments.site_id = ?", self.id)
  end
  
end
