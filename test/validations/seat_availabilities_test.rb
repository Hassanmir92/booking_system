# frozen_string_literal: true

require_relative '../test_helper'

module Validations
  class SeatAvailabilitiesTest < Minitest::Test
    def setup
      @theatre = Theatre.new

      booking_request = BookingRequest.new('(1,84:5,84:7)')
      @theatre.accept_booking(booking_request)
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
