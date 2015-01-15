# == Schema Information
#
# Table name: rhinobook_domains
#
#  id                 :integer          not null, primary key
#  rhinobook_books_id :integer
#  name               :string(255)
#  descr              :text
#  locale             :string(255)
#  active             :boolean          default(TRUE)
#  created_at         :datetime
#  updated_at         :datetime
#

module Rhinobook
	class Domain < ActiveRecord::Base
		belongs_to :book, :foreign_key => "rhinobook_books_id"

		validates :name, :locale, presence: true
		validates_uniqueness_of :name, scope: [:locale, :rhinobook_books_id]	
	end
end
