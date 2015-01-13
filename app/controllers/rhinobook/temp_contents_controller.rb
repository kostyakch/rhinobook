require_dependency "rhinobook/application_controller"

module Rhinobook
	class TempContentsController < ApplicationController
		def index			
		end

		def create
			@content = TempContent.new
			@content.contentable_id = params[:contentable_id]
			@content.contentable_type = params[:contentable_type]
			@content.content = params[:content]
			@content.save
		end


	end
end
