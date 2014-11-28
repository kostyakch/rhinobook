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

  def filename
    if original_filename
      original_filename.gsub! /\s*[^A-Za-z0-9\.\/]\s*/, '_'
      original_filename.strip
      original_filename.downcase
    end
  end
end
