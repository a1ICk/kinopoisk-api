class RatingPolicy < ApplicationPolicy
  attr_reader :user, :rating

  def initialize(user, rating)
    @user = user
    @rating = rating
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
end
