class AddBannerImageToSites < ActiveRecord::Migration
  def change
    add_column :sites, :banner_image, :string
  end
end
