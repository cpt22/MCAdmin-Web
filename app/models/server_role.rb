class ServerRole < ApplicationRecord
  belongs_to :server
  belongs_to :user

  enum role: {owner: 100, admin: 75, mod: 50, viewer: 25, no_access: 0}
end
