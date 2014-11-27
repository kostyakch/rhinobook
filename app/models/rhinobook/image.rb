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
