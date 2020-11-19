# frozen_string_literal: true

require_relative '../test_helper'

module Validations
  class SeatQuantityTest < Minitest::Test
    def test_valid?
      booking_request = BookingRequest.new('(1,84:5,84:7)')
      assert Validations::SeatQuantity.valid?(booking_request)

      booking_request = BookingRequest.new('(1,84:5,84:9)')
      assert Validations::SeatQuantity.valid?(booking_request)

      booking_request = BookingRequest.new('(1,84:5,84:15)')
      assert_equal false, Validations::SeatQuantity.valid?(booking_request)
    end
  end
end
