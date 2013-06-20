class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.integer :user_id
      t.string :email

      t.timestamps
    end
  end
end
