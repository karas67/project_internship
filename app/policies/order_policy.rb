class OrderPolicy < ApplicationPolicy
  def index?

  end
  
  def show?
    user.is_admin? || user.is_manager? || user.id == record.user_id
  end

  class Scope < Scope
    def resolve
      if user.is_a?(Admin) || user.is_a?(Manager)
        scope.all
      else
        #scope.where(user_id: user.id)
      end
    end
  end
end