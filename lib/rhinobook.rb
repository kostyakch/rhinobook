require 'devise'
require "rhinobook/engine"
require "rhinobook/utils"

module Rhinobook
	class Engine < ::Rails::Engine
		config.to_prepare do
			Devise::SessionsController.layout "application"
		end

	    config.sanitize_filter = {
	        :elements => ['p', 'ul', 'li', 'ol', 'table', 'tr', 'td', 'img', 'br', 'hr', 'b', 'strong', 'h2', 'h3', 'h4', 'i', 'pre', 'em', 'a'],
	        :attributes => {
	            'img' => ['src', 'alt', 'title'],
	            'a' => ['href', 'title', 'name'],
	        }
	    }		
	end	
end
