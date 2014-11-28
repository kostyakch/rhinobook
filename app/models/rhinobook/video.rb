module Rhinobook
	class Video < ActiveRecord::Base
		belongs_to :videoable, polymorphic: true

		SAFE_INFO_ACCESSORS = [ :alt, :title ]
		store :info, accessors: SAFE_INFO_ACCESSORS, coder: JSON

		validates :file, presence: true	

		mount_uploader :file, VideoUploader
	end
end
