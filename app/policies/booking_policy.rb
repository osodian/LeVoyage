class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def edit?
    user == record.user || user.admin
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
