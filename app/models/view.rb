class View < ActiveRecord::Base
  attr_accessible :user_id, :viewable_id, :viewable_type
  belongs_to :viewable, polymorphic: true
  belongs_to :user
end
