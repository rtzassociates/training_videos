class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, Viewer
      can :create, Viewing
      can :create, Comment
      
      cannot :read, User
      cannot :read, Site
      cannot :read, SiteContent
      cannot :read, StyleSetting
      
    end
  end
end
