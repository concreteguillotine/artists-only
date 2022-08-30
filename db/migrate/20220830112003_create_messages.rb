class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :text
      t.text :description

      t.timestamps
    end
  end
end
