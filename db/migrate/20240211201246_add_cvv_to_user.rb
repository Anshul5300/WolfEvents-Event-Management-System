class AddCvvToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :cvv, :string
  end
end
