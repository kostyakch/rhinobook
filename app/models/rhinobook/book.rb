module Rhinobook
	class Book < ActiveRecord::Base
		has_many :chapters, :dependent => :destroy
		accepts_nested_attributes_for :chapters, allow_destroy: true, reject_if: :all_blank

	end
end
