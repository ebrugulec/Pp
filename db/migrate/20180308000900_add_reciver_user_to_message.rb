class AddReciverUserToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :receiver_user_id, :integer
  end
end
