class AddChowTitleToRhinobookChapters < ActiveRecord::Migration
	def change
		add_column :rhinobook_chapters, :show_title, :boolean, :default => true
	end
end
