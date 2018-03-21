class CreateQuestion < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :title
      t.references :survey, foreign_key: true
    end
  end
end
