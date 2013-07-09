class Ability
  include CanCan::Ability

  def initialize(user)
    unless user.nil?
      can :create, Comment
      can :manage, Comment, :user_id => user.id
    end
  end
end
