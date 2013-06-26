class CreateSiteContents < ActiveRecord::Migration
  def change
    create_table :site_contents do |t|
      t.text :training_session_greeting
      t.text :footer_text
      t.integer :site_id

      t.timestamps
    end
  end
end
