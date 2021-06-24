class ServerRole < ApplicationRecord
  belongs_to :server
  belongs_to :user

  enum role: {owner: 100, admin: 75, mod: 50, viewer: 25, no_access: 0}

  validates :user, presence: true, uniqueness: {scope: [:server]}
  validates :server, presence: true
  validate :one_owner

private
  def one_owner
    if ServerRole.where(server: :server, role: :owner)
      errors.add(:base, "A server can only have one owner.")
    end
  end
end
