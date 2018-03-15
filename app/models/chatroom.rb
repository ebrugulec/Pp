class Chatroom < ApplicationRecord
  has_many :chatroom_users, after_add: :set_last_read_at
  has_many :messages
  has_many :users, through: :chatroom_users

  protected

  def set_last_read_at(obj)
    obj.last_read_at = Time.now
  end
end
