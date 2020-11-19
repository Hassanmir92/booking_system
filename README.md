# Cinema Booking System

A cinema has a theatre of 100 rows, each with 50 seats. Customers request particular seats when making a booking. Bookings are processed on a first-come, first-served basis. A booking is accepted as long as it is for five or fewer seats, all seats are adjacent and on the same row, all requested seats are available, and accepting the booking would not leave a single-seat gap (since the cinema believes nobody would book such a seat, and so loses the cinema money).

This system processes a text file of bookings and determines the number of bookings which are rejected.

The text file of bookings contains one booking per line, where a booking is of the following form:

(<id>,<index of first seat row>:<index of first seat within row>,<index of last seat row>:<index of last seat within row>),

Note: The trailing comma can be absent on the final line.

# Setup & Running
The problem is solved using Ruby with minitest as the testing framework.

## Running test:
rake test

## Running example:
bin/booking_system examples/booking_requests
