class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_many :posts
  has_many :comment
  has_many :conversations
  has_one_attached :image
  acts_as_voter

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
