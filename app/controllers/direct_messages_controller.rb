class DirectMessagesController < ApplicationController
  before_action :find_user

  def create
    @messagev = current_user.messages.build(message_params)
    @messagev.receiver_user_id = @user.id
    if @messagev.save
      redirect_to create_direct_path
    end
  end

  def index
    @messages = Message.where(receiver_user_id: @user.id, user_id: current_user.id).or(Message.where(receiver_user_id: current_user.id, user_id: @user.id)).order('created_at asc')
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
end
