class AddImageToBooks < ActiveRecord::Migration
	def change
		add_column :rhinobook_books, :author, :string

		add_column :rhinobook_books, :image_ru, :string
		add_column :rhinobook_books, :image_en, :string

		add_column :rhinobook_book_translations, :author, :string
	end
end
