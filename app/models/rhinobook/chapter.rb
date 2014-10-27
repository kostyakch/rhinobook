module Rhinobook
	class Chapter < ActiveRecord::Base
		belongs_to :book, :foreign_key => "rhinobook_books_id"

		has_many :pages, ->{ order(num: :asc) }, :dependent => :destroy, :foreign_key => "rhinobook_chapters_id"
		accepts_nested_attributes_for :pages, allow_destroy: true, reject_if: :all_blank

		validates :name, presence: true

		acts_as_list scope: :rhinobook_books_id

		translates :name, :descr
		globalize_accessors :locales => I18n.available_locales, :attributes => translated_attribute_names	
	end
end
