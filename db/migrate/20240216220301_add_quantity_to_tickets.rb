class AddQuantityToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :quantity, :integer
  end
end
