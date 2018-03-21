class DropOptionTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :options
  end
end
