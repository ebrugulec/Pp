class RoomChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatrooms.each do |chatroom|
      stream_from "room_channel:#{chatroom.id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def send_direct_message(data)
  #   message   = current_user.messages.build(content: data["content"], user: current_user, receiver_user_id: data["receiver_user_id"])
  #   p 'qqqqqqqqqqqqqqqqqqqqqq'
  #   p message.errors
  #   if message.save
  #     MessageRelayJob.perform_later(message)
  #   end
  # end
end
