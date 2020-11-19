# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/booking_request'
require_relative '../lib/theatre'

class TheatreTest < Minitest::Test
  def test_accept_booking
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    theatre = Theatre.new

    assert theatre.accept_booking(booking_request)
    assert_equal 1, theatre.bookings.count

    booking_request = BookingRequest.new('(1,84:70,84:72)')
    theatre = Theatre.new

    assert_equal false, theatre.accept_booking(booking_request)
    assert_equal 0, theatre.bookings.count
  end
end
