class RemoveUserFromSurvey < ActiveRecord::Migration[5.1]
  def change
    remove_column :surveys, :user_id
    remove_column :surveys, :users_id
  end
end
