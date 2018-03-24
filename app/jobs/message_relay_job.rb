class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatrooms:#{message.chatroom.id}", {
      # message: MessagesController.render(message),
      full_name: message.user.full_name,
      content: message.content,
      chatroom_id: message.chatroom.id
    }
  end
end
