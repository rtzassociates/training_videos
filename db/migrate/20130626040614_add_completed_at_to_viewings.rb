class AddCompletedAtToViewings < ActiveRecord::Migration
  def change
    add_column :viewings, :completed_at, :datetime
  end
end
