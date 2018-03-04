class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
end
