class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    if user == record.user
      true
    else
      redirect_to home_path
    end
  end

  def destroy?
    user == record.user
  end
end
