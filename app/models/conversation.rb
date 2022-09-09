class Conversation < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :user
  belongs_to :post
  has_one_attached :image

  scope :persisted, -> { where.not(id: nil) }
  scope :ordered, -> {order(created_at: :asc) }
end
