# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: 'admin@test.com', password: 'test123', password_confirmation: 'test123', role: 'admin', name: 'Admin Account')
User.create(email: 'user1@test.com', password: 'user123', password_confirmation: 'user123', role: 'attendee', name: 'User 1')
User.create(email: 'user2@test.com', password: 'user123', password_confirmation: 'user123', role: 'attendee', name: 'User 2')
User.create(email: 'user3@test.com', password: 'user123', password_confirmation: 'user123', role: 'attendee', name: 'User 3')

Room.create(room_id: '1', location: 'Talley Student Union', capacity: '50')
Room.create(room_id: '2', location: 'Hunt Library', capacity: '300')

Event.create(name: 'Event 1', category: 'Concerts', date: '2024-02-16', start_time: '2000-01-01 17:19:00', end_time: '2000-01-01 19:19:00', price: '99.99', seats_left: '27', room_id: '1')
Event.create(name: 'Event 2', category: 'Concerts', date: '2024-02-18', start_time: '2000-01-01 15:19:00', end_time: '2000-01-01 18:19:00', price: '29.99', seats_left: '15', room_id: '1')
Event.create(name: 'Event 3', category: 'Sports', date: '2024-02-28', start_time: '2000-01-01 15:19:00', end_time: '2000-01-01 17:19:00', price: '59.99', seats_left: '23', room_id: '1')

Ticket.create(user_id: '2', event_id: '1', room_id: '1', confirmation_number: '947d965d3c0ca6ca9af9', quantity: '3', total_cost: '299.97')
Ticket.create(user_id: '3', event_id: '2', room_id: '1', confirmation_number: 'daea635cfa4db8566425', quantity: '5', total_cost: '149.95')
Ticket.create(user_id: '4', event_id: '3', room_id: '1', confirmation_number: '93426bde47f5ce10e4dc', quantity: '2', total_cost: '119.98')

Review.create(user_id: '2', event_id: '1', rating: '3', feedback: 'Nice music event')
Review.create(user_id: '3', event_id: '2', rating: '1', feedback: 'Poorly organized event')