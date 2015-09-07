class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    #Guest
    can [:read], [Collection, Resource, User]
    can [:create], User

    #User
    if user.id
      can [:update], [Collection, Resource], user_id: user.id
      can [:sort], Collection, user_id: user.id
      can [:create], [Collection, Resource]
      can [:collect_one], Resource
      can [:update_resource_collection_description], Collection
      can [:update], User, id: user.id
    end
  end
end
