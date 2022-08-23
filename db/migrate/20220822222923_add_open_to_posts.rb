class AddOpenToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :open, :boolean, default: false
  end
end
