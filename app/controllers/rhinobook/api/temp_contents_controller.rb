require_dependency "rhinobook/application_controller"

module Rhinobook
	class Api::TempContentsController < ApplicationController
		caches_action :show, expires_in: 10.minutes, :cache_path => Proc.new { |c| c.params }

		def show			
			render json: TempContent.find_by(key_hash: params[:id])
		end
	end
end
