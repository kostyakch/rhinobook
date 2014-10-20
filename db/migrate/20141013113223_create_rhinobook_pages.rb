class CreateRhinobookPages < ActiveRecord::Migration
	def change
		create_table :rhinobook_pages do |t|
			t.references :rhinobook_chapters, index: true
			t.references :rhinobook_books, index: true

			t.integer :num
			t.text :content
			t.boolean :active, :default => true

			t.timestamps
		end
		add_index :rhinobook_pages, [:num, :rhinobook_book_id], :unique => true 
	end
end
