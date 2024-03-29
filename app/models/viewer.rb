class Viewer < ActiveRecord::Base
  attr_accessible :user_id, :name, :email
  
  belongs_to :user
  has_many :viewings, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
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
  
end