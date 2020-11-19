# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/booking_request'
require_relative '../../lib/validations/seat_existance'

module Validations
  class SeatExistanceTest < Minitest::Test
    def test_valid?
      booking_request = BookingRequest.new('(1,84:5,84:7)')
      assert Validations::SeatExistance.valid?(booking_request)

      booking_request = BookingRequest.new('(1,84:58,109:7)')
      assert_equal false, Validations::SeatExistance.valid?(booking_request)
    end
  end
end
