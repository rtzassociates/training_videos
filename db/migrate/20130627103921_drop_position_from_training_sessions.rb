class DropPositionFromTrainingSessions < ActiveRecord::Migration
  def up
    remove_column :training_sessions, :position
  end

  def down
    add_column :training_sessions, :position
  end
end
