class TranslateRhinobookChapters < ActiveRecord::Migration
	def self.up
		Rhinobook::Chapter.create_translation_table!({
			name: :string,
			descr: :text
		}, {
			migrate_data: true
		})
	end

	def self.down
		Rhinobook::Chapter.drop_translation_table! :migrate_data => true
	end
end
