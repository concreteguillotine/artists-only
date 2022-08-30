class AddTextDescriptionToConversations < ActiveRecord::Migration[6.1]
  def change
    add_column :conversations, :text, :text
    add_column :conversations, :description, :text
  end
end
