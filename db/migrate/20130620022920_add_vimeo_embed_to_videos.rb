class AddVimeoEmbedToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :vimeo_embed, :text
  end
end
