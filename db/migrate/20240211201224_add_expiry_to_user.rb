class AddExpiryToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :expiry, :string
  end
end
