module Rhinobook
	class ChaptersController < BaseController
		before_action :set_chapter, only: [:show, :edit, :update, :destroy]

		# GET /chapters
		def index
			@book = Book.find params[:book_id]
			@chapters = @book.chapters
		end

		# GET /chapters/1
		def show
		end

		# GET /chapters/new
		def new
			@chapter = Chapter.new
			@book = Book.find params[:book_id]
		end

		# GET /chapters/1/edit
		def edit
		end

		# POST /chapters
		def create
			@chapter = Chapter.new(chapter_params)
			@book = Book.find params[:book_id]
			@chapter.rhinobook_books_id = @book.id

			if @chapter.save
				redirect_to [@book, :chapters]
			else
				render action: 'new'
			end
		end

		# PATCH/PUT /chapters/1
		def update
			if @chapter.update(chapter_params)
				redirect_to [@book, :chapters]

			else
				render action: 'edit'
			end
		end

		# DELETE /chapters/1
		def destroy
			@chapter.destroy
			redirect_to [@book, :chapters]
		end

		private
			# Use callbacks to share common setup or constraints between actions.
			def set_chapter
				begin
					@book = Book.find(params[:book_id])
					@chapter = Chapter.find(params[:id])
				rescue
					render :template => 'site/not_found', :status => 404
				end
			end

			# Only allow a trusted parameter "white list" through.
			def chapter_params
				params[:chapter].permit!
			end
	end
end
