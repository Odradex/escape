class ServicePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def edit?
    true
  end

  def new?
    true
  end

  def update?
    true
  end

  def create?
    true
  end

  def total_price?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
