class Favorite < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :favoriteable, polymorphic: true
  belongs_to :user
end
