# == Schema Information
#
# Table name: rhinobook_images
#
#  id                :integer          not null, primary key
#  imageable_id      :integer
#  imageable_type    :string(255)
#  name              :string(255)
#  file              :string(255)
#  file_content_type :string(255)
#  position          :integer
#  info              :text
#  created_at        :datetime
#  updated_at        :datetime
#

module Rhinobook
	class Image < ActiveRecord::Base
		belongs_to :imageable, polymorphic: true

		SAFE_INFO_ACCESSORS = [ :alt, :title ]
		store :info, accessors: SAFE_INFO_ACCESSORS, coder: JSON

		validates :file, presence: true	

		mount_uploader :file, ImageUploader
		# acts_as_list scope: [:imageble_id, :imageble_type]
	
	end
end
