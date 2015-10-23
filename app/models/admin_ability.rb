class AdminAbility
  include CanCan::Ability

  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

  def initialize(admin)
    admin ||= Admin.new

    # Ya'll don't know me... I do what I want.
    #can :manage, :all

    can [:create, :read, :update], :all
    can :view, :dashboard

  end
end