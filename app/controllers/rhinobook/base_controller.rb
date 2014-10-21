require_dependency "rhinobook/application_controller"

module Rhinobook
	class BaseController < Rhinoart::ApplicationController
		before_filter :check_if_user_has_admin_role
		

		rescue_from CanCan::AccessDenied do |exception|
			if user_signed_in?
				flash.now[:info] = "Access denied."
				render :template => 'shared/no_approved', :status => 403
			else
				redirect_to new_user_session_path, alert: exception.message
			end
		end


		private    
			def check_if_user_has_admin_role
				authorize! :access, :admin_panel
			end		
	end
end