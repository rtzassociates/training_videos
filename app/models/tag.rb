class Tag < ActiveRecord::Base
  attr_accessible :name  
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
  
  def name
    read_attribute(:name).titleize
  end
end
