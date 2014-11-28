class AddParamsToPages < ActiveRecord::Migration
	def change
		add_column :rhinobook_pages, :params, :text
	end
end
