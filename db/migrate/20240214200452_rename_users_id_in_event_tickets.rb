class RenameUsersIdInEventTickets < ActiveRecord::Migration[7.1]
  def change
    rename_column :tickets, :users_id, :user_id

  end
end
