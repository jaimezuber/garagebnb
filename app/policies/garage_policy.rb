class GaragePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    user == record.owner
  end

  def destroy?
    user == record.owner
  end

  def my_garages?
    return true
  end
end
