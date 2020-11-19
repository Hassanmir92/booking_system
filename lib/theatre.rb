# frozen_string_literal: true

require_relative 'booking'

# This class represents the theate with the ability to accept and hold bookings
class Theatre
  attr_reader :bookings

  def initialize
    @bookings = []
  end

  def accept_booking(booking_request)
    booking = Booking.new(self, booking_request)

    return false unless booking.accept_request

    @bookings.push(booking)
  end

  def reserved_seats
    @bookings.collect(&:seats).flatten.compact
  end
end
