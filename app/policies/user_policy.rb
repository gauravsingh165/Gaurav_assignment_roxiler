class UserPolicy < ApplicationPolicy
  def show?
    user.role.name == 'Admin' || record.id == user.id
  end

  def index?
    user.role.name == 'Admin'
  end
end
