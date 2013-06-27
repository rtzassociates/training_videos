class DropVideoTags < ActiveRecord::Migration
  def up
    drop_table :video_tags
  end

  def down
  end
end
