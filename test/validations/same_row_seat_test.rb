# frozen_string_literal: true

require_relative '../test_helper'

module Validations
  class SameRowSeatTest < Minitest::Test
    def test_valid_when_start_row_and_end_row_match
      booking_request = BookingRequest.new('(1,84:5,84:7)')
      assert Validations::SameRowSeat.valid?(booking_request)
    end

    def test_valid_when_start_row_and_end_row_do_not_match
      booking_request = BookingRequest.new('(1,84:5,85:7)')
      assert_equal false, Validations::SameRowSeat.valid?(booking_request)
    end
  end
end
