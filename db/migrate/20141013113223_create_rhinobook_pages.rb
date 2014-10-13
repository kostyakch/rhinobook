class CreateRhinobookPages < ActiveRecord::Migration
	def change
		create_table :rhinobook_pages do |t|
			t.references :rhinobook_chapters, index: true

			t.integer :num
			t.text :content
			t.boolean :active, :default => true

			t.timestamps
		end
		add_index :rhinobook_pages, :num, :unique => true 
	end
end
