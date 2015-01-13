module Rhinobook
	class Page < Rhinoart::Base
		before_save :sanitize_content

		belongs_to :chapter, :foreign_key => "rhinobook_chapters_id"
		belongs_to :book, :foreign_key => "rhinobook_books_id"

		has_many :images, ->{ order(position: :asc) }, as: :imageable, :dependent => :destroy
		accepts_nested_attributes_for :images, allow_destroy: true#, reject_if: proc { |a| a['image_id'].blank? } 

		has_many :videos, ->{ order(position: :asc) }, as: :videoable, :dependent => :destroy
		accepts_nested_attributes_for :videos, allow_destroy: true#, reject_if: proc { |a| a['image_id'].blank? } 

	    has_many :statuses, as: :statusable, :dependent => :destroy
	    accepts_nested_attributes_for :statuses, allow_destroy: true, reject_if: proc { |s| s['status'].to_i == 0 && s['statusable_id'].to_s == '' } #proc { |s| s['status'].blank? }

		has_many :temp_contents, as: :contentable, :dependent => :destroy
		accepts_nested_attributes_for :temp_contents, allow_destroy: true

		SAFE_INFO_ACCESSORS = [ :advice, :resume ]
		store :params, accessors: SAFE_INFO_ACCESSORS, coder: JSON

		default_scope ->{ order(num: :asc) }

		# validates :content, presence: true

		acts_as_list column: :num, scope: :rhinobook_books_id

		translates :content, versioning: :paper_trail
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
