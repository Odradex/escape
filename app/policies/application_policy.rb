# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false unless admin?
  end

  def show?
    false unless admin?
  end

  def create?
    false unless admin?
  end

  def new?
    create?
  end

  def update?
    false unless admin?
  end

  def edit?
    update?
  end

  def destroy?
    false unless admin?
  end

  delegate :admin?, to: :user

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
