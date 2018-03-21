class RemoveDirectMessageToChatroom < ActiveRecord::Migration[5.1]
  def change
    remove_column :chatrooms, :direct_message
  end
end
