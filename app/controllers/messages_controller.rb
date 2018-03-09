class MessagesController < ApplicationController
  before_action :set_chatroom, only: :create
  before_action :get_messages, only: :index

  def create
    message = @chatroom.messages.new(message_params)
    message.user = current_user
    message.save
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def index
    @messages = Message.all
  end

  def create_message
    message = current_user.messages.build(message_params)
    # if message.save
    #   ActionCable.server.broadcast 'room_channel',
    #                                message: render_message(message)
    # end
  end

  private

  def get_messages
    @messages = Message.for_display
    @message  = current_user.messages.build
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end
end
