module Rhinobook
	class Page < ActiveRecord::Base
		before_save :sanitize_content

		belongs_to :chapter, :foreign_key => "rhinobook_chapters_id"
		belongs_to :book, :foreign_key => "rhinobook_books_id"

		has_many :images, ->{ order(position: :asc) }, as: :imageable, :dependent => :destroy
		accepts_nested_attributes_for :images, allow_destroy: true#, reject_if: proc { |a| a['image_id'].blank? } 


		default_scope ->{ order(num: :asc) }

		validates :content, presence: true

		acts_as_list column: :num, scope: :rhinobook_books_id

		translates :content
		globalize_accessors :locales => I18n.available_locales, :attributes => translated_attribute_names


		private	
			def sanitize_content
				require 'sanitize'
				I18n.available_locales.each do |locale|
					Globalize.with_locale(locale) do
						self.content = Sanitize.fragment(
							self.content, 
							:elements => Rhinobook::Engine.config.sanitize_filter[:elements], 
							:attributes => Rhinobook::Engine.config.sanitize_filter[:attributes],
							:css => Rhinobook::Engine.config.sanitize_filter[:css],
						)
					end
	            end
			end		
	end
end
