class ChangeVideoIdToTrainingSessionIdForViewings < ActiveRecord::Migration
  def up
    rename_column :viewings, :video_id, :training_session_id
  end

  def down
    rename_column :viewings, :training_session_id, :video_id
  end
end
