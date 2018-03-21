class SurveyUser < ApplicationRecord
  belongs_to :user
  belongs_to :survey
end
