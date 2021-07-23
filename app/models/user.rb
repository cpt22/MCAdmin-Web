class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  enum access_level: {admin: 100, moderator: 50, user: 1}

  has_many :server_roles, dependent: :destroy
  has_many :servers, through: :server_roles, inverse_of: :users

  def admin_access?
    return access_level.to_sym == :admin
  end

  def moderator_access?
    return access_level.to_sym == :moderator
  end

  def user_access?
    return access_level.to_sym == :user
  end

  def owned_servers
    return Server.where(id: self.server_roles.where(role: :owner).pluck(:server_id))
  end

end
