class CreateRhinobookDomains < ActiveRecord::Migration
	def change
		create_table :rhinobook_domains do |t|
			t.references :rhinobook_books, index: true

			t.string :name
			t.text :descr
			t.string :locale
			t.boolean :active, :default => true

			t.timestamps
		end
		add_index :rhinobook_domains, [:name, :locale, :rhinobook_books_id], :unique => true, name: 'index_rhinobook_domains_on_name_locale_books_id'
	end
end
