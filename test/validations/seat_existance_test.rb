# frozen_string_literal: true

require_relative '../test_helper'

module Validations
  class SeatExistanceTest < Minitest::Test
    def test_valid_when_seat_exists_given_row_and_seat_number
      booking_request = BookingRequest.new('(1,84:5,84:7)')
      assert Validations::SeatExistance.valid?(booking_request)
    end

    def test_valid_when_seat_does_not_exist_given_row_and_seat_number
      booking_request = BookingRequest.new('(1,84:58,109:7)')
      assert_equal false, Validations::SeatExistance.valid?(booking_request)
    end
  end
end
