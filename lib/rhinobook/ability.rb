module Rhinobook
  module Ability
    extend ActiveSupport::Concern

    included do
      alias_method_chain :initialize, :rhinobook
    end

    def initialize_with_rhinobook(user)

      user ||= Rhinoart::User.new
      initialize_without_rhinobook(user)

      return if !user.approved? or !user.admin?

      if user.has_admin_role?(Rhinoart::User::ADMIN_PANEL_ROLE_BOOKS_MANAGER)
        can :manage, :books
      end

    end
  end
end