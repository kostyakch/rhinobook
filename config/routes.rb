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
