class Player < ApplicationRecord
  has_many :player_servers, dependent: :destroy
  has_many :servers, through: :player_servers, inverse_of: :players
end
