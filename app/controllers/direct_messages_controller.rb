class DirectMessagesController < ApplicationController
  # before_action :find_user
  # before_action :generate_chatroom_id, only: :create

  def show
    users = [current_user, User.find(params[:id])]
    @chatroom = Chatroom.direct_message_for_users(users)
    @messages = @chatroom.messages.order(created_at: :desc).limit(7).reverse
    @chatroom_user = current_user.chatroom_users.find_by(chatroom_id: @chatroom.id)
    render "chatrooms/show"
  end

  # def create
  #
  #   @chatroom = Chatroom.find(params[:id])
  #   message = @chatroom.messages.new(message_params)
  #   message.user = current_user
  #   message.save
  #   @messages = @chatroom.messages
  #   render 'direct_messages/index', collection: @chatroom
  #   # if @messagev.save
  #   #   MessageRelayJob.perform_now(@messagev)
  #   # end
  # end
  #
  # def index
  #   if @chatroom
  #     @chatroom = Chatroom.find(params[:chatroom_id])
  #     @messages = @chatroom.messages
  #   end
  # end
  #
  # def create_chatroom
  #   @chatroom = Chatroom.create
  #   @chatroom_user1 = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
  #   @chatroom_user2 = @chatroom.chatroom_users.where(user_id: @user.id).first_or_create
  #   render 'direct_messages/index', collection: @chatroom
  # end
  #
  # private
  #
  # def message_params
  #   params.require(:message).permit(:content)
  # end
  #
  # def find_user
  #   @user = User.find_by(id: params[:id])
  #   if @user
  #   else
  #     p 'user yok'
  #   end
  # end
  #
  # def render_message(message)
  #   p 'eeeeeeeeeeeeeeeeeeeeeeee'
  #   p message
  #     render(partial: 'messages/message', locals: { message: message })
  # end
  #
  # def message
  #   Message.where(receiver_user_id: @user.id, user_id: current_user.id)
  #                      .or(Message.where(receiver_user_id: current_user.id, user_id: @user.id))
  # end
  #
  # def generate_chatroom_id
  #   @random = loop do
  #     random = SecureRandom.random_number(100)
  #     break random unless Message.exists?(chatroom_id: random)
  #   end
  # end
end
