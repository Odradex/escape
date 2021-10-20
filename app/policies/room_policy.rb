class RoomPolicy < ApplicationPolicy
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

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(organization.in?(user.organizations))
      end
    end
  end
end
