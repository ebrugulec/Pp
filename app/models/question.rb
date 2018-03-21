class Question < ApplicationRecord
  belongs_to :survey
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: lambda {|attributes| attributes['content'].blank?}, allow_destroy: true
end
