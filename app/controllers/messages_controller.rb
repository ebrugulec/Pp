class MessagesController < ApplicationController
  before_action :set_chatroom

  def create
    message = @chatroom.messages.new(message_params)
    message.user = current_user
    message.save
  end

  private

  def set_chatroom
    p 'mesaj geldi'
    p params[:chatroom_id]
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  # before_action :get_messages
  #
  # def index
  # end
  #
  # def create
  #   message = current_user.messages.build(message_params)
  #   if message.save
  #     ActionCable.server.broadcast 'room_channel',
  #                                  message: render_message(message)
  #   end
  # end
  #
  # private
  #
  # def get_messages
  #   @messages = Message.for_display
  #   @message  = current_user.messages.build
  # end
  #
  # def message_params
  #   params.require(:message).permit(:content)
  # end
  #
  # def render_message(message)
  #   render(partial: 'message', locals: { message: message })
  # end
  #
  # def render_message(message)
  #   render(partial: 'message', locals: { message: message })
  # end
end
