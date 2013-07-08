# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  version :thumbnail do
    process resize_to_fill: [200, 100]
  end

  version :small do
    process resize_to_fit: [200, 200]
  end
  
  version :squared do
    process resize_to_fill: [400, 400]
  end
  
  version :banner do
    process resize_to_fill: [940, 160]
  end

  def height
    if (@file)
      img = ::Magick::Image::read(@file.file).first
      return img.rows
    end
  end
  
  def default_url
    "/images/fallback/" + [version_name, "background.png"].compact.join('_')
  end

end
