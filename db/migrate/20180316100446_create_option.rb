class CreateOption < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.references :question, foreign_key: true
    end
  end
end
