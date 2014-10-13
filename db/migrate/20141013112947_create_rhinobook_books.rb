class CreateRhinobookBooks < ActiveRecord::Migration
	def change
		create_table :rhinobook_books do |t|
			t.string :name, :null => false
			t.string :slug, :null => false
			t.text :descr
			t.boolean :active, :default => true

			t.timestamps
		end
		add_index :rhinobook_books, :name, :unique => true 
		add_index :rhinobook_books, :slug, :unique => true 
	end
end
