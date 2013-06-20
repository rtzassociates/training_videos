class AddVideoIdToViewings < ActiveRecord::Migration
  def change
    add_column :viewings, :video_id, :integer
  end
end
