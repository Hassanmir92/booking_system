# frozen_string_literal: true

require_relative '../test_helper'

module Validations
  class SingleSeatGapTest < Minitest::Test
    def setup
      @theatre = Theatre.new

      booking_request = BookingRequest.new('(1,84:5,84:7)')
      @theatre.accept_booking(booking_request)
    end

    def test_valid_when_booking_request_leave_gap_before_start_seat
      booking_request = BookingRequest.new('(1,84:0,84:3)')
      assert_equal false, Validations::SingleSeatGap.valid?(@theatre, booking_request)
    end

    def test_valid_when_booking_request_leave_gap_after_end_seat
      booking_request = BookingRequest.new('(1,84:9,84:11)')
      assert_equal false, Validations::SingleSeatGap.valid?(@theatre, booking_request)
    end

    def test_valid_when_booking_request_is_right_after_another_reservation
      booking_request = BookingRequest.new('(1,84:8,84:11)')
      assert Validations::SingleSeatGap.valid?(@theatre, booking_request)
    end

    def test_valid_when_booking_request_is_right_before_another_reservation
      booking_request = BookingRequest.new('(1,84:0,84:4)')
      assert Validations::SingleSeatGap.valid?(@theatre, booking_request)
    end

    def test_valid_when_booking_request_leaves_atleast_two_gaps_before_start_seat
      booking_request = BookingRequest.new('(1,84:0,84:2)')
      assert Validations::SingleSeatGap.valid?(@theatre, booking_request)
    end

    def test_valid_when_booking_request_leaves_atleast_two_gaps_after_end_seat
      booking_request = BookingRequest.new('(1,84:10,84:11)')
      assert Validations::SingleSeatGap.valid?(@theatre, booking_request)
    end
  end
end
