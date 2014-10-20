require 'devise'
require "rhinobook/engine"
require "rhinobook/utils"

module Rhinobook
	class Engine < ::Rails::Engine
		config.to_prepare do
			Devise::SessionsController.layout "application"
		end
	end	
end
