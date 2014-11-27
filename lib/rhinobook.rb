require 'devise'
require "rhinobook/engine"
require "rhinobook/utils"

module Rhinobook
	class Engine < ::Rails::Engine
		config.to_prepare do
			Devise::SessionsController.layout "application"
		end

	    config.sanitize_filter = {
	        :elements => ['p', 'ul', 'li', 'ol', 'table', 'tr', 'td', 'img', 'br', 'hr', 'b', 'strong', 'h2', 'h3', 'h4', 'i', 'pre', 'em', 'a', 'video', 'source', 'span'],
	        :attributes => {
	            'img' => ['src', 'alt', 'title'],
	            'a' => ['href', 'title', 'name'],
	            'p' => ['style', 'color'],
	            'video' => ['width', 'height', 'controls', 'autoplay', 'loop', 'muted', 'poster', 'preload'],
	            'source' => ['src', 'type'],
	            'span' => ['style']
	        },
			:css => {
				:properties => ['color', 'text-align', 'background-color'],
			},
	    }		
	end	
end
