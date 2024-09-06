<<<<<<< HEAD
json.extract! review, :id, :users_id, :event_id, :rating, :feedback, :created_at, :updated_at
=======
json.extract! review, :id, :attendee_id, :event_id, :rating, :feedback, :created_at, :updated_at
>>>>>>> ed9d1c6809ff70661ce3144ee3b67679cd272b44
json.url review_url(review, format: :json)
