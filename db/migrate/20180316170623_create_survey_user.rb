class CreateSurveyUser < ActiveRecord::Migration[5.1]
  def change
    create_table :survey_users do |t|
      t.references :user, foreign_key: true
      t.references :survey, foreign_key: true
    end
  end
end
