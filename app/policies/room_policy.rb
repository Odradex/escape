class RoomPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.present?
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

    private

    attr_reader :user, :scope
  end

  private

  def admin_or_owner?
    if @record.organization.present?
      user.admin? || @record.organization.user == user
    else
      user.admin?
    end
  end
end
