json.extract! room, :id, :room_id, :location, :capacity, :created_at, :updated_at
json.url room_url(room, format: :json)
