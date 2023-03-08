class ProducerPolicy < ApplicationPolicy
  attr_reader :user, :producer

  def initialize(user, producer)
    @user = user
    @producer = producer
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
