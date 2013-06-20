class TrainingSession < ActiveRecord::Base
  attr_accessible :name, :user_id, :pdf, :vimeo_embed

  mount_uploader :pdf, PdfUploader

  belongs_to :user

  has_many :viewings, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :vimeo_embed, :presence => true
end