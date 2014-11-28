# encoding: utf-8

#require 'carrierwave/processing/mime_types'

class VideoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MimeTypes

  # process :set_content_type
  # process :save_content_type_in_model

  # def save_content_type_in_model
  #   model.file_content_type = file.content_type if file.content_type
  # end

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end



  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(mp4)
  end  

  # def filename
  #   if original_filename
  #     original_filename.gsub! /\s*[^A-Za-z0-9\.\/]\s*/, '_'
  #     original_filename.strip
  #     original_filename.downcase
  #   end
  # end
  
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  # def filename
  #   if original_filename
  #     original_filename.gsub! /\s*[^A-Za-z0-9\.\/]\s*/, '_'
  #     original_filename.strip
  #     original_filename.downcase
  #   end
  # end
end
