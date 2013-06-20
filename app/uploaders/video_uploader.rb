# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  
  include CarrierWave::Video
  include ::CarrierWave::Backgrounder::Delay
  
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_white_list
    %w(mp4 m4v)
  end
  
  #   TO ENABLE ENCODING, YOU'LL NEED TO INSTALL FFMPEG ON THE SERVER
  #   ALONG WITH ALL THE NECESSARY ENCODING LIBRARIES
  #
  #   version :mp4 do
  #     process :encode_video => [:mp4, resolution: :same]
  #     def full_filename(for_file)
  #       super.chomp(File.extname(super)) + '.mp4'
  #     end
  #   end
  #       
  #   version :webm do
  #     process :encode_video => [:webm, resolution: :same]
  #     def full_filename(for_file)
  #       super.chomp(File.extname(super)) + '.webm'
  #     end
  #   end
  #   
  #   version :ogv do
  #     process :encode_video => [:ogv, resolution: :same]
  #     def full_filename(for_file)
  #       super.chomp(File.extname(super)) + '.ogv'
  #     end
  #   end

end