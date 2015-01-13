module Rhinobook
	class TempContent < ActiveRecord::Base
		before_create :create_key_hash

		belongs_to :contentable, polymorphic: true

		def as_json(options = {})
			options[:only] ||= [:content]
			super(options)
		end	

	    private
	        def create_key_hash
	            self.key_hash = SecureRandom.urlsafe_base64
	        end
	end
end
