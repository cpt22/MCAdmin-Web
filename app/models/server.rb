class Server < ApplicationRecord
  has_many :player_servers, dependent: :destroy
  has_many :players, through: :player_servers, inverse_of: :servers
  #has_many :players, -> { select('players.*, player_servers.status as status, player_servers.banned as banned, player_servers.updated_at as last_seen') }, through: :player_servers
  has_many :server_roles, dependent: :destroy
  has_many :users, through: :server_roles, inverse_of: :servers

  validates :name, presence: true

  def owner
    return User.find(self.server_roles.where(role: :owner).pluck(:id))
  end

  def online_player_count
    return self.player_servers.where(status: :online).count
  end
end
