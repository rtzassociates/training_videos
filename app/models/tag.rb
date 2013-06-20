class Tag < ActiveRecord::Base
  attr_accessible :name
  
  has_many :video_tags, :dependent => :destroy
  has_many :videos, through: :video_tags
  
  def self.tokens(query)
    tags = where("name like ?", "%#{query}%")
    if tags.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      tags
    end
  end
  
  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end
  
  def self.ids_from_names(names)
    where(:name => names).map(&:id)
  end
  
  def self.count
    all.sort_by{|t| -t.videos.count }
  end
  
  def name
    read_attribute(:name).titleize
  end
  
  def thumbnail
    Video.joins(:tags).where("tags.id = ?", self.id).order("tags.created_at DESC").first
  end
  
end
