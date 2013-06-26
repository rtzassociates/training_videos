class StyleSetting < ActiveRecord::Base
  attr_accessible :site_id, :body_background_color, :footer_background_color, :footer_text_color,
                  :link_color
  
  belongs_to :site
end
