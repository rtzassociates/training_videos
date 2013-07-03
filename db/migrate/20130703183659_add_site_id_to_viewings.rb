class AddSiteIdToViewings < ActiveRecord::Migration
  def change
    add_column :viewings, :site_id, :integer
  end
end
