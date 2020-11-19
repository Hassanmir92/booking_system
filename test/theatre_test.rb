# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/booking_request'
require_relative '../lib/theatre'

class TheatreTest < Minitest::Test
  def test_accept_booking_when_booking_is_valid
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    theatre = Theatre.new

    assert theatre.accept_booking(booking_request)
    assert_equal 1, theatre.bookings.count
  end

  def test_accept_booking_when_booking_is_invalid
    booking_request = BookingRequest.new('(1,84:70,84:72)')
    theatre = Theatre.new

    assert_equal false, theatre.accept_booking(booking_request)
    assert_equal 0, theatre.bookings.count
  end

  def test_reserved_seats
    theatre = Theatre.new

    booking_request = BookingRequest.new('(1,84:5,84:7)')
    theatre.accept_booking(booking_request)

    booking_request = BookingRequest.new('(1,84:20,84:23)')
    theatre.accept_booking(booking_request)

    booking_request = BookingRequest.new('(1,84:20,84:23)')
    theatre.accept_booking(booking_request)

    assert_equal 7, theatre.reserved_seats.count
  end
end
