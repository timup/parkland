class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can [:read], Collection
    can [:update], Collection, user_id: user.id
    can [:create], Collection if user.id

    can [:read], Resource
    can [:update], Resource, user_id: user.id
    can [:create], Resource if user.id

    can [:create, :read], User
    can [:update], User, id: user.id
  end
end
