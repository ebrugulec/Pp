class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatrooms.each do |chatroom|
      stream_from "chatrooms:#{chatroom.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    @chatroom = Chatroom.find(data["chatroom_id"])
    message   = @chatroom.messages.create(content: data["content"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
