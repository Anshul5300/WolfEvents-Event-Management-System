class AddRoomIdToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :room_id, :integer
    add_index :events, :room_id
  end
end
