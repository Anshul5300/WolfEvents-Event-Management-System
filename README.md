
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

![image](https://github.com/user-attachments/assets/f9ea4d0f-bd7f-44e2-9d51-503fcaeab845)

---

### Rooms
View existing rooms on the portal. Only admin can add new rooms.

![image](https://github.com/user-attachments/assets/ce2daf3a-4d59-4071-9ed5-7b65529fed35)

---

### Events
View existing events on the portal. Only admin can add new events. Use filters to view specific events.

![image](https://github.com/user-attachments/assets/8e659184-8775-45a5-a959-59c7423f40c7)

---

### Tickets
Buy tickets for upcoming events on the portal. Option to buy more than one ticket. Price is calculated automatically.

![image](https://github.com/user-attachments/assets/70919aa8-de0d-4483-9953-b12e84f5c3de)

---

### Reviews
Add reviews for the events you have attended. Ability to view all reviews for all the events that have finished.

![image](https://github.com/user-attachments/assets/7f0db37f-fcb6-4690-ac75-f711e75fc00d)

---
### Edit Profile
Edit any existing data we have about you on our system.

![image](https://github.com/user-attachments/assets/c3c33b2c-8b74-4d61-a737-60ee76ab15c5)

---

### Delete Account
Unhappy with our system? You can delete your presence from our records. Admin cannot delete their account.

![image](https://github.com/user-attachments/assets/feffcb90-7de7-4b49-a590-989a37510343)

---

## Acknowledgements
We would like to thank Dr. Edward Gehringer for giving us to the opportunity to gain hands-on programming and deployment experience of Ruby on Rails.
