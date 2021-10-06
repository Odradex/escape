class OrganizationPolicy < ApplicationPolicy
  def index?
    !user.customer?
  end

  def show?
    admin_or_owner
  end

  def new?
    user.admin?
  end

  def destroy?
    admin_or_owner
  end

  def update?
    admin_or_owner
  end

  def create?
    new?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  private

  def admin_or_owner
    user.admin? || @record.user == user
  end
end
