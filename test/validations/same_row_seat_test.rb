# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/booking_request'
require_relative '../../lib/validations/same_row_seat'

module Validations
  class SameRowSeatTest < Minitest::Test
    def test_valid?
      booking_request = BookingRequest.new('(1,84:5,84:7)')
      assert Validations::SameRowSeat.valid?(booking_request)

      booking_request = BookingRequest.new('(1,84:5,85:7)')
      assert_equal false, Validations::SameRowSeat.valid?(booking_request)
    end
  end
end
