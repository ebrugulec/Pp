class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invite_for => 2.weeks
  acts_as_messageable

  has_many :messages
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :survey_users
  has_many :surveys, through: :survey_users

  validates :full_name, presence: true

  def name
    "User #{id}"
  end

  def mailboxer_email(object)
    nil
  end

  def online?
    updated_at > 10.minutes.ago ? true : false
  end
end
