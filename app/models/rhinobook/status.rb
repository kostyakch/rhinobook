# == Schema Information
#
# Table name: rhinobook_statuses
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  statusable_id   :integer
#  statusable_type :string(255)
#  status          :integer
#  locale          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

module Rhinobook
	class Status < ActiveRecord::Base
		before_validation :set_status
		before_save :set_current_user

		belongs_to :statusable, polymorphic: true #, reject_if: :all_null

		STATUSES = {
			:created => 0, 
			:edited => 1, 
			:published => 2,
		}
		
		# validates :statusable_id, :statusable_type, :status, :locale, presence: true
		validates :status, :locale, presence: true
		validates_uniqueness_of :statusable_id, scope: [:statusable_type, :status, :locale]

		def pre_status
			Status.where('statusable_id = ? and statusable_type = ? and locale = ? and id != ?', self.statusable_id, self.statusable_type, self.locale, self.id).last
		end

		private
			def set_current_user
				self.user_id = Rhinoart::User::current.id
			end

			def set_status
				if self.statusable.present? && self.statusable.statuses.where(locale: self.locale).last.present?
					self.status = self.statusable.statuses.where(locale: self.locale).last.status.to_i + 1
				else
					self.status = 0
				end
			end	
	end
end
