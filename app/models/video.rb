class Video < ActiveRecord::Base
  attr_accessible :video, :name, :user_id, :pdf, :vimeo_embed
  
  attr_reader :tag_tokens
  
  mount_uploader :video, VideoUploader
  process_in_background :video
  
  mount_uploader :thumbnail, ImageUploader
  mount_uploader :pdf, PdfUploader

  belongs_to :user
  belongs_to :category
  
  has_many :video_tags, :dependent => :destroy
  has_many :tags, through: :video_tags
  has_many :favorites, as: :favoriteable, :dependent => :destroy
  has_many :views, as: :viewable, :dependent => :destroy
  has_many :viewings, :dependent => :destroy
  
  has_one :comment
  
  validates :name, :presence => true
  validates :user_id, :presence => true

  def name
    read_attribute(:name).nil? ? File.basename(video.filename, '.*').titleize : read_attribute(:name) 
  end
  
  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end
  
  def tag_names
    self.tags.map(&:name)
  end
  
  def self.find_by_tag_names(tag_names = [])
    Photo.joins(:tags).where(:tags => { :name => tag_names })
  end
  
  def set_success(format, opts)
    self.success = true
  end
  
end
