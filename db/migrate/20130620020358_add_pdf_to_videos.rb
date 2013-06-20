class AddPdfToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :pdf, :string
  end
end
