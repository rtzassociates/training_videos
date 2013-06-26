class AddLinkColorToStyleSettings < ActiveRecord::Migration
  def change
    add_column :style_settings, :link_color, :string
  end
end
