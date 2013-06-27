class DropViews < ActiveRecord::Migration
  def up
    drop_table :views
  end

  def down
  end
end
