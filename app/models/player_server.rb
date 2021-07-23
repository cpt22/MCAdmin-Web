class PlayerServer < ApplicationRecord
  belongs_to :server
  belongs_to :player

  enum banned: {false: false, true: true}
  enum status: {online: true, offline: false}

  validates :server, presence: true, uniqueness: {scope: [:player]}
  validates :player, presence: true
end
