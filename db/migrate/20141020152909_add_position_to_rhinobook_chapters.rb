class AddPositionToRhinobookChapters < ActiveRecord::Migration
	def change
		add_column :rhinobook_chapters, :position, :integer
	end
end
