# == Schema Information
#
# Table name: rhinobook_temp_contents
#
#  id               :integer          not null, primary key
#  contentable_id   :integer
#  contentable_type :string(255)
#  key_hash         :string(255)
#  content          :text
#  info             :text
#  last_show        :datetime
#  last_show_ip     :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

module Rhinobook
	class TempContent < ActiveRecord::Base
		before_create :create_key_hash
		after_find :set_last_show

		belongs_to :contentable, polymorphic: true

		SAFE_INFO_ACCESSORS = [ :author ]
		store :info, accessors: SAFE_INFO_ACCESSORS, coder: JSON

		def as_json(options = {})
			options[:only] ||= [:content]
			options[:methods] ||= [:author]
			super(options)
		end	

		def author1
			
		end
	    private
	        def create_key_hash
	            self.key_hash = SecureRandom.urlsafe_base64
	        end

	        def set_last_show
	        	self.last_show = Time.new
	        	self.save
	        end
	end
end
