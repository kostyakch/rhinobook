module Rhinobook
	class Book < ActiveRecord::Base
		before_validation :name_to_slug

		has_many :pages, :dependent => :destroy, :foreign_key => "rhinobook_books_id"
		accepts_nested_attributes_for :pages, allow_destroy: true, reject_if: :all_blank

		has_many :chapters, ->{ order(position: :asc) }, :dependent => :destroy, :foreign_key => "rhinobook_books_id"
		accepts_nested_attributes_for :chapters, allow_destroy: true, reject_if: :all_blank

		has_many :domains, :dependent => :destroy, :foreign_key => "rhinobook_books_id"
		accepts_nested_attributes_for :domains, allow_destroy: true, reject_if: :all_blank

		mount_uploader :image_ru, ImageUploader
		mount_uploader :image_en, ImageUploader

		validates :name, :slug, presence: true
		validates_uniqueness_of :name, :slug		

		translates :name, :descr, :author

		globalize_accessors :locales => I18n.available_locales, :attributes => translated_attribute_names	


		private
			def name_to_slug
				if !self.slug.present?
					self.slug = Rhinobook::Utils.to_slug(self.name)
				else
					self.slug = Rhinobook::Utils.to_slug(self.slug)
				end
			end
	end
end
