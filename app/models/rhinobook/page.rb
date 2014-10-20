module Rhinobook
	class Page < ActiveRecord::Base
		belongs_to :chapter, :foreign_key => "rhinobook_chapters_id"
		belongs_to :book, :foreign_key => "rhinobook_books_id"

		default_scope ->{ order(num: :asc) }

		validates :content, presence: true

		acts_as_list column: :num, scope: :rhinobook_books_id
	end
end
