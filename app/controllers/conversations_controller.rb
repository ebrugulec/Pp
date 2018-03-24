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

  def trash
    @conversations = current_user.mailbox.trash
    render action: :index
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
    if params[:all]
      recepients = User.where('id != ?', current_user.id)
    else
      recepients = User.where(id: params[:user_ids])
    end
    receipt = current_user.send_message(recepients, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end
end
