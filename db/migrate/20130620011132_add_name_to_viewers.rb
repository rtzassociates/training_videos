class AddNameToViewers < ActiveRecord::Migration
  def change
    add_column :viewers, :name, :string
  end
end
