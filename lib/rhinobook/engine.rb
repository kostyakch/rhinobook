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

      # Rhinoart::User::ADMIN_PANEL_ROLE_BOOK_MANAGER = "Book Manager"
      # Rhinoart::User::ADMIN_PANEL_ROLE_BOOK_AUTHOR = "Book Author"

      # # Content editors
      # Rhinoart::User::ADMIN_PANEL_ROLE_BOOK_CREATOR = "Book Creator"
      # Rhinoart::User::ADMIN_PANEL_ROLE_BOOK_EDITOR = "Book Editor"
      # Rhinoart::User::ADMIN_PANEL_ROLE_BOOK_PUBLISHER = "Book Publisher"

      # Rhinoart::User::ADMIN_PANEL_ROLES.push(
      #   Rhinoart::User::ADMIN_PANEL_ROLE_BOOK_MANAGER, 
      #   Rhinoart::User::ADMIN_PANEL_ROLE_BOOK_AUTHOR, 
      #   Rhinoart::User::ADMIN_PANEL_ROLE_BOOK_CREATOR, 
      #   Rhinoart::User::ADMIN_PANEL_ROLE_BOOK_EDITOR, 
      #   Rhinoart::User::ADMIN_PANEL_ROLE_BOOK_PUBLISHER
      # ) 

      Rhinoart::UserRoles.add_admin_role 'Book Manager'
      Rhinoart::UserRoles.add_admin_role 'Book Author'
      Rhinoart::UserRoles.add_admin_role 'Book Creator'
      Rhinoart::UserRoles.add_admin_role 'Book Editor'
      Rhinoart::UserRoles.add_admin_role 'Book Publisher'

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
