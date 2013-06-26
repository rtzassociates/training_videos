class TrainingSession < ActiveRecord::Base
  attr_accessible :name, :user_id, :pdf, :vimeo_embed

  mount_uploader :pdf, PdfUploader

  belongs_to :user

  has_many :viewings, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  validates :name, :presence => true
  validates :user_id, :presence => true
  validates :vimeo_embed, :presence => true
  
  def pdf_name
    self.pdf.to_s.split("/").last
  end
  
  def completed_by?(viewer)
    viewings.where("viewings.training_session_id = ? 
                    AND viewings.viewer_id = ? 
                    AND viewings.completed_at IS NOT NULL",
                    self.id, viewer.id).any?
  end
end