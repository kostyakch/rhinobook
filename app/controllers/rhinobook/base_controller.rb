require_dependency "rhinobook/application_controller"

module Rhinobook
	class BaseController < Rhinoart::BaseController
		before_action :set_locale
		
		def set_locale
			I18n.locale = params[:locale] || I18n.default_locale
		end	

		def default_url_options(options={})
			if I18n.locale != I18n.default_locale
				{ locale: I18n.locale }
			else
				{ locale: nil }
			end
		end		
	end
end