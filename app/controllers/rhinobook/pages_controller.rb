module Rhinobook
	class PagesController < BaseController
		before_action :set_page, only: [:show, :edit, :update, :destroy]

		# GET /pages
		def index
			# @pages = Page.where().order(:num)
			@chapter = Chapter.find(params[:chapter_id])
			@pages = @chapter.pages
		end

		# GET /pages/1
		def show
		end

		# GET /pages/new
		def new
			@page = Page.new
			@chapter = Chapter.find(params[:chapter_id])
		end

		# GET /pages/1/edit
		def edit
		end

		# POST /pages
		def create
			@page = Page.new(page_params)
			@chapter = Chapter.find(params[:chapter_id])
			
			@page.rhinobook_chapters_id = @chapter.id	
			@page.rhinobook_books_id = @chapter.rhinobook_books_id			

			if @page.save
				redirect_to [@chapter, :pages]
			else
				render action: 'new'
			end
		end

		# PATCH/PUT /pages/1
		def update
			if @page.update(page_params)
				redirect_to [@chapter, :pages]
			else
				render action: 'edit'
			end
		end

		# DELETE /pages/1
		def destroy
			@page.destroy
			redirect_to [@chapter, :pages]
		end

		private
			# Use callbacks to share common setup or constraints between actions.
			def set_page
				begin
					@page = Page.find(params[:id])
					@chapter = Chapter.find(params[:chapter_id])
				rescue
					render :template => 'site/not_found', :status => 404
				end
			end

			# Only allow a trusted parameter "white list" through.
			def page_params
				params[:page].permit!
			end
	end
end
