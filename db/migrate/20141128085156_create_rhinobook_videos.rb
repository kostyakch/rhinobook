class CreateRhinobookVideos < ActiveRecord::Migration
	def change
		create_table :rhinobook_videos do |t|
			t.references :videoable, polymorphic: true

			t.string :name
			t.string :file
			t.string :file_content_type
			t.integer :position
			t.text :info

			t.timestamps
		end
	end
end
