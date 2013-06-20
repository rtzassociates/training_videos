class RenameVideosTableToTrainingSessions < ActiveRecord::Migration
  def up
    rename_table :videos, :training_sessions
    remove_column :training_sessions, :video
  end

  def down
    add_column :training_sessions, :video
    rename_table :training_sessions, :videos
  end
end