# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/booking'
require_relative '../lib/booking_request'
require_relative '../lib/theatre'

class BookingTest < Minitest::Test
  def setup
    @theatre = Theatre.new
  end

  def test_accept_request
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.accept_request
    assert_equal 3, booking.seats.count

    booking_request = BookingRequest.new('(1,84:49,84:51)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.accept_request
    assert_equal 0, booking.seats.count
  end
end
