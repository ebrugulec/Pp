class DirectMessagesController < ApplicationController
  before_action :find_user
  before_action :generate_chatroom_id, only: :create

  def create
    @messagev = current_user.messages.build(message_params)


      @chatroom = Chatroom.create
      @chatroom.chatroom_users.where(user_id: @user.id).first_or_create
      @chatroom.chatroom_users.create(user_id: current_user.id)
      p 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
      p @user.chatrooms.last
      @messagev.chatroom_id = @chatroom.id

    if @messagev.save
      MessageRelayJob.perform_now(@messagev)
    end
  end

  def index
    @messages = message.order('created_at asc')
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def find_user
    @user = User.find_by(id: params[:id])
    if @user
    else
      p 'user yok'
    end
  end

  def render_message(message)
    p 'eeeeeeeeeeeeeeeeeeeeeeee'
    p message
      render(partial: 'messages/message', locals: { message: message })
  end

  def message
    Message.where(receiver_user_id: @user.id, user_id: current_user.id)
                       .or(Message.where(receiver_user_id: current_user.id, user_id: @user.id))
  end

  def generate_chatroom_id
    @random = loop do
      random = SecureRandom.random_number(100)
      break random unless Message.exists?(chatroom_id: random)
    end
  end
end
