class AddSuccessToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :success, :boolean
  end
end
