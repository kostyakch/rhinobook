class TranslateRhinobookPages < ActiveRecord::Migration
	def self.up
		Rhinobook::Page.create_translation_table!({
			content: :text
		}, {
			migrate_data: true
		})
	end

	def self.down
		Rhinobook::Page.drop_translation_table! :migrate_data => true
	end
end
