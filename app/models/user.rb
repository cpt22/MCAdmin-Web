class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_many :servers, through: :server_roles
  has_many :owned_servers, inverse_of: 'owner'

end
