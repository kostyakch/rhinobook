# == Schema Information
#
# Table name: rhinobook_chapters
#
#  id                 :integer          not null, primary key
#  rhinobook_books_id :integer
#  name               :string(255)
#  descr              :text
#  active             :boolean          default(TRUE)
#  created_at         :datetime
#  updated_at         :datetime
#  position           :integer
#  show_title         :boolean          default(TRUE)
#

module Rhinobook
	class Chapter < Rhinoart::Base
		belongs_to :book, :foreign_key => "rhinobook_books_id"

		has_many :pages, ->{ order(num: :asc) }, :dependent => :destroy, :foreign_key => "rhinobook_chapters_id"
		accepts_nested_attributes_for :pages, allow_destroy: true, reject_if: :all_blank

		validates :name, presence: true

		acts_as_list scope: :rhinobook_books_id

		translates :name, :descr, versioning: :paper_trail
		globalize_accessors :locales => I18n.available_locales, :attributes => translated_attribute_names	

		def can_edit?
			res = true
			pages.each do |p|
				if !p.can_edit?
					res = false
					break
				end
			end

			return res
		end
	end
end
