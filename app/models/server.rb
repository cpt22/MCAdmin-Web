class Server < ApplicationRecord
  has_many :players, through: :player_servers
  has_many :users, through: :server_roles
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :name, presence: true
  validates :owner, presence: true
end
