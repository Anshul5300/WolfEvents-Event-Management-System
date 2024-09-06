class RenameRoomIdInEventTickets < ActiveRecord::Migration[7.1]
  def change
    rename_column :tickets, :events_id, :event_id
    rename_column :tickets, :rooms_id, :room_id
  end
end
