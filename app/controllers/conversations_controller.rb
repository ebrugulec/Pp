class ConversationsController < ApplicationController
  def index
    @conversations = current_user.mailbox.conversations
  end

  def inbox
    @conversations = current_user.mailbox.inbox
    render action: :index
  end

  def sent
    @conversations = current_user.mailbox.sentbox
    render action: :index
  end

  def trash_sil
    @conversation = current_user.mailbox.conversations(id: params[:id])
    current_user.trash(@conversation)
      render action: :index
    # @conversations = current_user.mailbox.trash
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @conversation.mark_as_read(current_user)
    @message = Mailboxer::Message.new
  end

  def new
    @receipts = User.all - [current_user]
  end

  def create
    if params[:message][:all] == "1"
      recepients = User.where('id != ?', current_user.id)
    else
      recepients = User.where(id: params[:message][:user_ids])
    end
    receipt = current_user.send_message(
                            recepients,
                            params[:message][:body],
                            params[:message][:subject],
                            true,
                            params[:message][:attachment])
    redirect_to conversation_path(receipt.conversation)
  end
end
