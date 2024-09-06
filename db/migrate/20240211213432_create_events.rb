class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.string :date
      t.time :start_time
      t.time :end_time
      t.float :price
      t.integer :seats_left

      t.timestamps
    end
  end
end
