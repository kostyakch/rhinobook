# == Schema Information
#
# Table name: rhinobook_videos
#
#  id                :integer          not null, primary key
#  videoable_id      :integer
#  videoable_type    :string(255)
#  name              :string(255)
#  file              :string(255)
#  file_content_type :string(255)
#  position          :integer
#  info              :text
#  created_at        :datetime
#  updated_at        :datetime
#

module Rhinobook
	class Video < ActiveRecord::Base
		belongs_to :videoable, polymorphic: true

		SAFE_INFO_ACCESSORS = [ :poster ]
		store :info, accessors: SAFE_INFO_ACCESSORS, coder: JSON

		validates :file, presence: true	

		mount_uploader :file, VideoUploader

		has_many :images, as: :imageable, :dependent => :destroy
		accepts_nested_attributes_for :images, allow_destroy: true
	end
end
