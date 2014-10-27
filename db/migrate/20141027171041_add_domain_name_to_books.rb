class AddDomainNameToBooks < ActiveRecord::Migration
	def change
		add_column :rhinobook_books, :domain_name, :string
	end
end
