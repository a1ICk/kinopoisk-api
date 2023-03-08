class MoviePolicy < ApplicationPolicy
  attr_reader :user, :movie

  def initialize(user, movie)
    @user = user
    @movie = movie
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
