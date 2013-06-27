class AddPositionToSiteTrainingSessions < ActiveRecord::Migration
  def change
    add_column :site_training_sessions, :position, :integer
  end
end
