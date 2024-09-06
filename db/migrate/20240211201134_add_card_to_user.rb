class AddCardToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :card, :integer
  end
end
