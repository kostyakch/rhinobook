module Rhinobook
	class Domain < ActiveRecord::Base
		belongs_to :book, :foreign_key => "rhinobook_books_id"

		validates :name, :locale, presence: true
		validates_uniqueness_of :name, scope: [:locale, :rhinobook_books_id]	
	end
end
