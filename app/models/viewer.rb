class Viewer < ActiveRecord::Base
  attr_accessible :user_id, :name, :email
  
  belongs_to :user
  
  validates :name, :presence => true
  validates :user_id, :presence => true
  validates_presence_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
end