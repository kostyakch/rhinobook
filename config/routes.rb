Rhinobook::Engine.routes.draw do
    devise_for :users, class_name: "Rhinoart::User", module: :devise, 
        :controllers => { :sessions => "rhinoart/sessions", :passwords => "rhinoart/passwords"  } 
        
	root :to => 'pages#index'

	resources :books do
		resources :chapters do 
			# resources :pages
		end
	end

	resources :chapters, only: :nil do 
		resources :pages, on: :collection
	end

end


#    book_chapters GET    /books/:book_id/chapters(.:format)             rhinobook/chapters#index
#                  POST   /books/:book_id/chapters(.:format)             rhinobook/chapters#create
# new_book_chapter GET    /books/:book_id/chapters/new(.:format)         rhinobook/chapters#new
# edit_book_chapter GET    /books/:book_id/chapters/:id/edit(.:format)    rhinobook/chapters#edit
#     book_chapter GET    /books/:book_id/chapters/:id(.:format)         rhinobook/chapters#show
#                  PATCH  /books/:book_id/chapters/:id(.:format)         rhinobook/chapters#update
#                  PUT    /books/:book_id/chapters/:id(.:format)         rhinobook/chapters#update
#                  DELETE /books/:book_id/chapters/:id(.:format)         rhinobook/chapters#destroy
#            books GET    /books(.:format)                               rhinobook/books#index
#                  POST   /books(.:format)                               rhinobook/books#create
#         new_book GET    /books/new(.:format)                           rhinobook/books#new
#        edit_book GET    /books/:id/edit(.:format)                      rhinobook/books#edit
#             book GET    /books/:id(.:format)                           rhinobook/books#show
#                  PATCH  /books/:id(.:format)                           rhinobook/books#update
#                  PUT    /books/:id(.:format)                           rhinobook/books#update
#                  DELETE /books/:id(.:format)                           rhinobook/books#destroy

#    chapter_pages GET    /chapters/:chapter_id/pages(.:format)          rhinobook/pages#index
#                  POST   /chapters/:chapter_id/pages(.:format)          rhinobook/pages#create
# new_chapter_page GET    /chapters/:chapter_id/pages/new(.:format)      rhinobook/pages#new
# edit_chapter_page GET    /chapters/:chapter_id/pages/:id/edit(.:format) rhinobook/pages#edit
#     chapter_page GET    /chapters/:chapter_id/pages/:id(.:format)      rhinobook/pages#show
#                  PATCH  /chapters/:chapter_id/pages/:id(.:format)      rhinobook/pages#update
#                  PUT    /chapters/:chapter_id/pages/:id(.:format)      rhinobook/pages#update
#                  DELETE /chapters/:chapter_id/pages/:id(.:format)      rhinobook/pages#destroy