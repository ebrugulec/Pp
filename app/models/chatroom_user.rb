class ChatroomUser < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  before_create :set_last_read_at

  def set_last_read_at
    self.last_read_at = Time.zone.now
  end

end
