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

        resources :statuses, only: :destroy do
            post 'set_new_status/:statusable_id/:statusable_type/:locale' => 'statuses#set_new_status', on: :collection, as: :set_new_status, via: :js
        end
	end
end
