module Rhinobook
	module ApplicationHelper

		def av_locales
			if current_user.present? && current_user.locales.present? && current_user.locales.count > 0 	
				current_user.locales
			else
				I18n.available_locales
			end
		end		
	end
end
