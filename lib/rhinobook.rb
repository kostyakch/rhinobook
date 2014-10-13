require 'devise'
require "rhinobook/engine"

module Rhinobook
	class Engine < ::Rails::Engine
		config.to_prepare do
			Devise::SessionsController.layout "application"
		end
	end	
end
