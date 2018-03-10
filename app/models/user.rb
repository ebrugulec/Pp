class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_messageable

  has_many :messages
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users

  def name
    "User #{id}"
  end

  def mailboxer_email(object)
    nil
  end
end
