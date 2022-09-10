class AddAddltextToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :addltext, :text
  end
end
