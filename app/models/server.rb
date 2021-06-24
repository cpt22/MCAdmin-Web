class Server < ApplicationRecord
  has_many :players, through: :player_servers
  has_many :server_roles, dependent: :destroy
  has_many :users, through: :server_roles, inverse_of: :server_roles

  validates :name, presence: true

  def owner
    return User.find(self.server_roles.where(role: :owner).pluck(:id))
  end
end
