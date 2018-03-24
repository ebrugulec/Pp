class AddUserFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :departmant, :string
  end
end
