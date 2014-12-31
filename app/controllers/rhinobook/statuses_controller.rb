require_dependency "rhinobook/application_controller"

module Rhinobook
	class StatusesController < BaseController
		def destroy
			@status = Status.find params[:id]
			@status.destroy
			respond_to do |format|
				format.html { redirect_back_or [:admin, @status] }
				format.js { }
			end
		end

		def set_new_status
			@status = Status.new
			@status.statusable_id = params[:statusable_id]
			@status.statusable_type = params[:statusable_type]
			@status.locale = params[:locale]
			ex_statuses = Status.where(statusable_id: params[:statusable_id], statusable_type: params[:statusable_type], locale: params[:locale])
			@status.save if ex_statuses.count < 3
		end
	end
end
