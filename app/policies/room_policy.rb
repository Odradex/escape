class RoomPolicy < ApplicationPolicy
  def index?
    admin_or_owner?
  end

  def show?
    admin_or_owner?
  end

  def edit?
    admin_or_owner?
  end

  def new?
    admin_or_owner?
  end

  def update?
    admin_or_owner?
  end

  def create?
    admin_or_owner?
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

  private

  def admin_or_owner?
    user.admin? || @record.organization.user == user
  end
end
