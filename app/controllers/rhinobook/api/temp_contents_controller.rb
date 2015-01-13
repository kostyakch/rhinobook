require_dependency "rhinobook/application_controller"

module Rhinobook
	class Api::TempContentsController < ApplicationController
		def show			
			render json: TempContent.find_by(key_hash: params[:id])
		end
	end
end
