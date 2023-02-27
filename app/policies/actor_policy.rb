class ActorPolicy < ApplicationPolicy
  attr_reader :user, :actor

  def initialize(user, actor)
    @user = user
    @actor = actor
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end
end
