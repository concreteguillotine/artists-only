class Conversation < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :user
  belongs_to :post
  has_one_attached :image
end
