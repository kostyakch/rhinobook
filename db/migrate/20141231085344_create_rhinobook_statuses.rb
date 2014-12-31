class CreateRhinobookStatuses < ActiveRecord::Migration
	def change
		create_table :rhinobook_statuses do |t|
			t.references :user, index: true
			t.references :statusable, polymorphic: true

			t.integer :status
			t.string :locale

			t.timestamps
		end
		add_index :rhinobook_statuses, :status
		add_index :rhinobook_statuses, [:statusable_id, :status, :locale], unique: true
	end

	def self.down
		remove_index :rhinobook_statuses, :status
		remove_index :rhinobook_statuses, [:statusable_id, :statusable_type, :status, :locale], name: 'index_statuses_on_statusable_id_and_status_and_locale'

		drop_table :rhinobook_statuses
	end 
end
