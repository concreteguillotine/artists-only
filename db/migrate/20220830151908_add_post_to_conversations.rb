class AddPostToConversations < ActiveRecord::Migration[6.1]
  def change
    add_reference :conversations, :post, null: false, foreign_key: true
  end
end
