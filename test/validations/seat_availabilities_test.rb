# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/booking_request'
require_relative '../../lib/booking'
require_relative '../../lib/theatre'
require_relative '../../lib/validations/seat_availabilities'

module Validations
  class SeatAvailabilitiesTest < Minitest::Test
    def setup
      @theatre = Theatre.new

      booking_request = BookingRequest.new('(1,84:5,84:7)')
      booking = Booking.new(@theatre, booking_request)
      booking.accept_request

      @theatre.bookings.push(booking)
    end

    def test_valid?
      booking_request = BookingRequest.new('(1,84:3,84:5)')
      assert_equal false, Validations::SeatAvailabilities.valid?(@theatre, booking_request)

      booking_request = BookingRequest.new('(1,84:5,84:7)')
      assert_equal false, Validations::SeatAvailabilities.valid?(@theatre, booking_request)

      booking_request = BookingRequest.new('(1,84:7,84:11)')
      assert_equal false, Validations::SeatAvailabilities.valid?(@theatre, booking_request)

      booking_request = BookingRequest.new('(1,84:25,84:28)')
      assert Validations::SeatAvailabilities.valid?(@theatre, booking_request)

      booking_request = BookingRequest.new('(1,84:0,84:4)')
      assert Validations::SeatAvailabilities.valid?(@theatre, booking_request)
    end
  end
end
