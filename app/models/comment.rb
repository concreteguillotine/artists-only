class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: "User"

  validates :text, presence: true

  scope :persisted, -> { where.not(id: nil) }
  scope :ordered, -> {order(created_at: :asc) }
end
