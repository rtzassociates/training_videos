class Category < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :video_ids, :thumbnail
  
  belongs_to :user
  has_many :videos
  
  mount_uploader :thumbnail, ImageUploader
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      order("id DESC")
    end
  end
  
  def name
    read_attribute(:name).titleize
  end

end