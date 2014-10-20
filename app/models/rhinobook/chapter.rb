module Rhinobook
	class Chapter < ActiveRecord::Base
		belongs_to :book, :foreign_key => "rhinobook_books_id"

		has_many :pages, ->{ order(num: :asc) }, :dependent => :destroy, :foreign_key => "rhinobook_chapters_id"
		accepts_nested_attributes_for :pages, allow_destroy: true, reject_if: :all_blank

		validates :name, presence: true
	end
end
