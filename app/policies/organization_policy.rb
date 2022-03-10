class OrganizationPolicy < ApplicationPolicy
  def index?
    !user.customer?
  end

  def show?
    true
  end

  def new?
    user.admin?
  end

  def destroy?
    admin_or_owner?
  end

  def update?
    admin_or_owner?
  end

  def create?
    new?
  end

  def rooms?
    true
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end

    private

    attr_reader :user, :scope
  end

  private

  def admin_or_owner?
    user.admin? || @record.user == user
  end
end
