class CreateSiteTrainingSessions < ActiveRecord::Migration
  def change
    create_table :site_training_sessions do |t|
      t.integer :site_id
      t.integer :training_session_id

      t.timestamps
    end
  end
end
