# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/booking_request'
require_relative '../../lib/booking'
require_relative '../../lib/theatre'
require_relative '../../lib/validations/seat_availabilities'

module Validations
  class SingleSeatGapTest < Minitest::Test
    def setup
      @theatre = Theatre.new

      booking_request = BookingRequest.new('(1,84:5,84:7)')
      booking = Booking.new(@theatre, booking_request)
      booking.accept_request

      @theatre.bookings.push(booking)
    end

    def test_valid?
      booking_request = BookingRequest.new('(1,84:0,84:3)')
      assert_equal false, Validations::SingleSeatGap.valid?(@theatre, booking_request)

      booking_request = BookingRequest.new('(1,84:9,84:11)')
      assert_equal false, Validations::SingleSeatGap.valid?(@theatre, booking_request)

      booking_request = BookingRequest.new('(1,84:8,84:11)')
      assert Validations::SingleSeatGap.valid?(@theatre, booking_request)

      booking_request = BookingRequest.new('(1,84:0,84:4)')
      assert Validations::SingleSeatGap.valid?(@theatre, booking_request)

      booking_request = BookingRequest.new('(1,84:0,84:2)')
      assert Validations::SingleSeatGap.valid?(@theatre, booking_request)

      booking_request = BookingRequest.new('(1,84:10,84:11)')
      assert Validations::SingleSeatGap.valid?(@theatre, booking_request)
    end
  end
end
