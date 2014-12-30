Rhinobook::Engine.routes.draw do

    devise_for :users, class_name: "Rhinoart::User", module: :devise, 
        :controllers => { :sessions => "rhinoart/sessions", :passwords => "rhinoart/passwords"  } 
        
	scope "(:locale)", locale: /ru|en/ do 
		root :to => 'books#index'

		resources :books do
			resources :domains
			resources :chapters
			get 'reorder_pages'
		end		

		resources :chapters, only: :nil do 
			resources :pages, on: :collection
		end
	end
end
