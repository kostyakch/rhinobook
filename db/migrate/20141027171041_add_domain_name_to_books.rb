class AddDomainNameToBooks < ActiveRecord::Migration
	def change
		add_column :rhinobook_books, :domain_name, :string
		add_column :rhinobook_books, :locale, :string
	end
end
