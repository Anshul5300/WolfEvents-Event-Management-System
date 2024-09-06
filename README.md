
# RAILS EVENT MANAGEMENT SYSTEM

## Overview

WolfEvents is an event management system designed for North Carolina State University (NCSU), comprising six main components: Admin, Attendee, Room, Event, Event Ticket, and Review. The system allows users to explore events, purchase tickets, and provide reviews.

Admin functionalities include creating, viewing, editing, and deleting events, attendees, tickets, reviews, and rooms. The admin can also book events, view all attendees, and search for available rooms in specific time slots.

Attendees can sign up, log in, edit their profile, delete their account, view available events, filter events by category, date, and price, book event tickets, view booking history, write reviews for attended events, edit their own reviews, and cancel tickets.

Events are created by the admin and include attributes such as event name, room ID, category, date, start and end times, ticket price, and number of seats left. Event tickets are generated upon booking, containing information like attendee ID, event ID, room ID, and confirmation number.

Rooms have attributes such as ID, location, and capacity, and only the admin can book events in specific rooms for particular time slots.

Reviews allow attendees to rate events and provide feedback. Reviews can only be written for events of certain categories and can be searched by user or event name.

Both admin and users have access to functionalities like editing profiles, viewing booking history, and searching for reviews. Users can also purchase tickets and cancel bookings, while the admin can perform additional actions like managing attendees and rooms, creating events, and booking tickets to attend events.

Overall, WolfEvents ensures seamless event management, ticket booking, and review submission for both administrators and attendees at NCSU.

## Ruby Versions

The ruby version being used in the project is 3.2.3 and rails version being used is 7.1.3

## Deployment

The application is deployed on NCSU VCL. It can be accessed at:  [http://152.7.177.219:8080](http://152.7.177.219:8080)

## Seed Users
### Admin
Username: admin@test.com
Password: test123

### Attendee
Username: user1@test.com
Password: user123

Username: user2@test.com
Password: user123

Username: user3@test.com
Password: user123

## Workflow
### Sign-in/Sign-up
Login using exisitng credentials or sign-up to create a new attendee account.

<img width="1512" alt="image" src="https://media.github.ncsu.edu/user/30766/files/4cf33d51-6cea-47e8-98e9-6a2214394ee0">

---

### Rooms
View existing rooms on the portal. Only admin can add new rooms.

<img width="1512" alt="image" src="https://media.github.ncsu.edu/user/30766/files/85c52794-1850-4587-b037-fc6fd20d20dc">

---

### Events
View existing events on the portal. Only admin can add new events. Use filters to view specific events.

<img width="1512" alt="image" src="https://media.github.ncsu.edu/user/30766/files/708fc7bc-0369-424b-86b3-323a96ce79a8">

---

### Tickets
Buy tickets for upcoming events on the portal. Option to buy more than one ticket. Price is calculated automatically.

<img width="1512" alt="image" src="https://media.github.ncsu.edu/user/30766/files/e2c0ea9c-17b5-4d93-aa67-ee8ad430c97a">

---

### Reviews
Add reviews for the events you have attended. Ability to view all reviews for all the events that have finished.

<img width="1510" alt="image" src="https://media.github.ncsu.edu/user/30766/files/d5b7922b-251e-4268-a5d3-68a66ad8ab93">

---
### Edit Profile
Edit any existing data we have about you on our system.

<img width="1512" alt="image" src="https://media.github.ncsu.edu/user/30766/files/553c3ab9-b810-49b0-a446-da34deda0833">

---

### Delete Account
Unhappy with our system? You can delete your presence from our records. Admin cannot delete their account.

<img width="1509" alt="image" src="https://media.github.ncsu.edu/user/30766/files/9d142337-dc9e-4541-af87-1cbbd8005ec4">

---

## Acknowledgements
We would like to thank Dr. Edward Gehringer for giving us to the opportunity to gain hands-on programming and deployment experience of Ruby on Rails.
