class CreateStyleSettings < ActiveRecord::Migration
  def change
    create_table :style_settings do |t|
      t.string :body_background_color
      t.string :footer_background_color
      t.string :footer_text_color
      t.integer :site_id

      t.timestamps
    end
  end
end
