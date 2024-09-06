json.extract! ticket, :id, :users_id, :events_id, :rooms_id, :confirmation_number, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
