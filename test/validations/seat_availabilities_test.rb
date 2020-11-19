# frozen_string_literal: true

require_relative '../test_helper'

module Validations
  class SeatAvailabilitiesTest < Minitest::Test
    def setup
      @theatre = Theatre.new

      booking_request = BookingRequest.new('(1,84:5,84:7)')
      @theatre.accept_booking(booking_request)
    end

    def test_valid_when_part_of_seats_are_already_reserved_towards_the_end_seat
      booking_request = BookingRequest.new('(1,84:3,84:5)')
      assert_equal false, Validations::SeatAvailabilities.valid?(@theatre, booking_request)
    end

    def test_valid_when_all_of_seats_are_already_reserved
      booking_request = BookingRequest.new('(1,84:5,84:7)')
      assert_equal false, Validations::SeatAvailabilities.valid?(@theatre, booking_request)
    end

    def test_valid_when_part_of_seats_are_already_reserved_towards_the_start_seat
      booking_request = BookingRequest.new('(1,84:7,84:11)')
      assert_equal false, Validations::SeatAvailabilities.valid?(@theatre, booking_request)
    end

    def test_valid_when_seats_are_after_already_reserved_seats
      booking_request = BookingRequest.new('(1,84:25,84:28)')
      assert Validations::SeatAvailabilities.valid?(@theatre, booking_request)
    end

    def test_valid_when_seats_are_before_already_reserved_seats
      booking_request = BookingRequest.new('(1,84:0,84:4)')
      assert Validations::SeatAvailabilities.valid?(@theatre, booking_request)
    end
  end
end
