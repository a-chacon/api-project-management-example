class TaskPolicy < ApplicationPolicy
  def create?
    user.roles.exists?(project: record.project, role: :manager)
  end
end
