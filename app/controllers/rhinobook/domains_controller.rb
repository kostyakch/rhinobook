module Rhinobook
    class DomainsController < BaseController
        before_action :set_domain, only: [:edit, :update, :destroy]

        def index
            @domains = Domain.all
            @book = Book.find(params[:book_id])
        end

        def new
            @domain = Domain.new
            @book = Book.find params[:book_id]
        end

        def create
            @domain = Domain.new(domain_params)
            @book = Book.find params[:book_id]
            @domain.rhinobook_books_id = @book.id

            if @domain.save
                redirect_to [@book, :domains]
            else
                render action: 'new'
            end            
        end

        def edit
        end

        def update
            if @domain.update(domain_params)
                redirect_to [@book, :domains]

            else
                render action: 'edit'
            end
        end

        def destroy
            @domain.destroy
            redirect_to [@book, :domains]
        end

        private
            # Use callbacks to share common setup or constraints between actions.
            def set_domain
                begin
                    @domain = Domain.find(params[:id])
                    @book = Book.find(params[:book_id])
                rescue
                    render :template => 'site/not_found', :status => 404
                end
            end

            # Only allow a trusted parameter "white list" through.
            def domain_params
                params[:domain].permit!
            end
    end
end
