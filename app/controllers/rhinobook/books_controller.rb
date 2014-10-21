module Rhinobook
	class BooksController < BaseController
		before_action :set_book, only: [:show, :edit, :update, :destroy]

		# GET /books
		def index
			@books = Book.all
		end

		# GET /books/1
		def show
		end

		# GET /books/new
		def new
			@book = Book.new
		end

		# GET /books/1/edit
		def edit
		end

		# POST /books
		def create
			@book = Book.new(book_params)

			if @book.save
				redirect_to :books
			else
				render action: 'new'
			end
		end

		# PATCH/PUT /books/1
		def update
			if @book.update(book_params)
				redirect_to :books
			else
				render action: 'edit'
			end
		end

		# DELETE /books/1
		def destroy
			@book.destroy
			redirect_to :books
		end

		private
			# Use callbacks to share common setup or constraints between actions.
			def set_book
				begin
					@book = Book.find(params[:id])
				rescue
					render :template => 'site/not_found', :status => 404
				end				
			end

			# Only allow a trusted parameter "white list" through.
			def book_params
				params[:book].permit!
			end
	end
end
