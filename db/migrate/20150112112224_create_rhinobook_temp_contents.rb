class CreateRhinobookTempContents < ActiveRecord::Migration
	def change
		create_table :rhinobook_temp_contents do |t|
			t.references :contentable, polymorphic: true

			t.string :key_hash
			t.text :content
			t.text :info

			t.datetime :last_show
			t.string   :last_show_ip

			t.timestamps
		end
		add_index :rhinobook_temp_contents, :key_hash, unique: true
	end
end
