class Player < ApplicationRecord
  has_many :servers, through: :player_servers
end
