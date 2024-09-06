class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.integer :room_id
      t.string :location
      t.string :capacity

      t.timestamps
    end
  end
end
