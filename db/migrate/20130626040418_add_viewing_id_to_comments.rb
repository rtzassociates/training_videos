class AddViewingIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :viewing_id, :integer
  end
end
