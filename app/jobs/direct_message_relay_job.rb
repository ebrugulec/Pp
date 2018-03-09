class DirectMessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    p 'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu'
    p message
    ActionCable.server.broadcast "room_channel:#{message.chatroom_id}", {
      message: MessagesController.render(message),
      chatroom_id: message.chatroom_id
    }
  end
end
