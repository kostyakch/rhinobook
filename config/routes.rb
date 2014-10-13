Rhinobook::Engine.routes.draw do
    devise_for :users, class_name: "Rhinoart::User", module: :devise, 
        :controllers => { :sessions => "rhinoart/sessions", :passwords => "rhinoart/passwords"  } 
        
	root :to => 'pages#index'

	resources :pages

	resources :chapters

	resources :books

end
