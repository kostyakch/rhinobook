require 'haml-rails'
require 'mini_magick'
require 'carrierwave'
require 'bootstrap-sass'
require 'jquery-rails'
require 'acts_as_list'
require 'rhinoart'
require "rhinoart/utils"

module Rhinobook
  class Engine < ::Rails::Engine
    isolate_namespace Rhinobook

    initializer "rhinobook.init" do |app|     

      Rhinoart::User.add_admin_role 'Book Manager'
      Rhinoart::User.add_admin_role 'Book Author'
      Rhinoart::User.add_admin_role 'Book Creator'
      Rhinoart::User.add_admin_role 'Book Editor'
      Rhinoart::User.add_admin_role 'Book Publisher'

      Rhinoart::Menu::MainMenu.add_item({
        icon: 'fa-icon-book',
        link: proc{ rhinobook.books_path },
        label: 'rhinoart_gallery.books',
        allowed: proc{ can?(:manage, :books) },
        active: proc{ 
        	controller_name == 'books' ||  
        	controller_name == 'chapters' ||  
        	controller_name == 'domains' ||  
        	controller_name == 'pages' ||  
        	controller_name == 'statuses'
        }
      })
    end
  end
end
