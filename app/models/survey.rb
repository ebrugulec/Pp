class Survey < ApplicationRecord
  has_many :survey_users, dependent: :destroy
  has_many :users, through: :survey_users
  has_many :questions, dependent: :destroy

  accepts_nested_attributes_for :questions, reject_if: lambda {|attributes| attributes['title'].blank?}, allow_destroy: true
end
