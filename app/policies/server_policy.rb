class ServerPolicy < ApplicationPolicy
  def index?
    return true
  end

  def show?
    return user.admin_access? || !ServerRole.where("user_id = :user_id AND server_id = :server_id AND role > :min_access_role",
      {user_id: user.id, server_id: @record.id, min_access_role: :no_access}).empty?
  end
end
