class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!

    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    record.client == user
  end

  def destroy?
    record.client == user
  end

  def decline_booking?
    record.garage.owner == user
  end

  def accept_booking?
    record.garage.owner == user
  end
end
