class ChangeVideoIdToTrainingSessionIdForComments < ActiveRecord::Migration
  def up
    rename_column :comments, :video_id, :training_session_id
  end

  def down
    rename_column :comments, :training_session_id, :video_id
  end
end
