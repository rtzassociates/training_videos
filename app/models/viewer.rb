class Viewer < ActiveRecord::Base
  attr_accessible :user_id, :name, :email
  
  belongs_to :user
  
  validates :name, :presence => true
  validates :user_id, :presence => true
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  
  before_save { |viewer| viewer.name = viewer.name.downcase }
  before_save { |viewer| viewer.email = viewer.email.downcase }
  
  def name
    read_attribute(:name).downcase
  end
  
  def email
    read_attribute(:email).downcase
  end
  
  def self.authenticate(name, email)
    viewer = find_by_name(name.downcase)
    return viewer if viewer && viewer.email == email.downcase
  end
  
end