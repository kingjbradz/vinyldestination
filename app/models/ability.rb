# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      
    user ||= User.new
      if user.has_role?(:admin)
        can :manage, :all
        can :manage, :user
      else
        can :manage, Vinyl, user_id: user.id
        can :read, :all
        can :buy, :all
      end
  end
end
