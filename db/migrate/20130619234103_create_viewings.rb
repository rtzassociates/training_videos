class CreateViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.integer :viewer_id
      t.string :participants

      t.timestamps
    end
  end
end
