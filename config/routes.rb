Rhinobook::Engine.routes.draw do

    devise_for :users, class_name: "Rhinoart::User", module: :devise, 
        :controllers => { :sessions => "rhinoart/sessions", :passwords => "rhinoart/passwords"  } 
        
	# scope "(:locale)", locale: /ru|en/ do 
		root :to => 'pages#index'

		resources :books do
			resources :domains
			resources :chapters
		end		

		resources :chapters, only: :nil do 
			resources :pages, on: :collection
		end
	# end

end


#     book_domains GET    /books/:book_id/domains(.:format)              rhinobook/domains#index
#                  POST   /books/:book_id/domains(.:format)              rhinobook/domains#create
#  new_book_domain GET    /books/:book_id/domains/new(.:format)          rhinobook/domains#new
# edit_book_domain GET    /books/:book_id/domains/:id/edit(.:format)     rhinobook/domains#edit
#      book_domain GET    /books/:book_id/domains/:id(.:format)          rhinobook/domains#show
#                  PATCH  /books/:book_id/domains/:id(.:format)          rhinobook/domains#update
#                  PUT    /books/:book_id/domains/:id(.:format)          rhinobook/domains#update
#                  DELETE /books/:book_id/domains/:id(.:format)          rhinobook/domains#destroy