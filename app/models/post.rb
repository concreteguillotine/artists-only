class Post < ApplicationRecord
    has_one_attached :image
    has_one_attached :addlimage
    has_many :comments, dependent: :destroy
    has_many :conversations, dependent: :destroy
    belongs_to :author, class_name: "User"
    acts_as_votable
end
