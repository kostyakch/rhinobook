class CreateRhinobookChapters < ActiveRecord::Migration
	def change
		create_table :rhinobook_chapters do |t|
			t.references :rhinobook_books, index: true
			
			t.string :name
			t.text :descr
			t.boolean :active, :default => true

			t.timestamps
		end
		add_index :rhinobook_chapters, :name, :unique => true 
	end
end
