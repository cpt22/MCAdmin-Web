class PlayerServer < ApplicationRecord
  belongs_to :server
  belongs_to :player

  enum status: {online: true, offline: false}
end
