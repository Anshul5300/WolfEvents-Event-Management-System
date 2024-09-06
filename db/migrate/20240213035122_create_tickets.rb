class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.references :users, null: false, foreign_key: true
      t.references :events, null: false, foreign_key: true
      t.references :rooms, null: false, foreign_key: true
      t.string :confirmation_number

      t.timestamps
    end
  end
end
