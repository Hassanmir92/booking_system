# frozen_string_literal: true

require_relative '../test_helper'

module Validations
  class SeatQuantityTest < Minitest::Test
    def test_valid_when_number_of_seats_is_fewer_than_five
      booking_request = BookingRequest.new('(1,84:5,84:7)')
      assert Validations::SeatQuantity.valid?(booking_request)
    end

    def test_valid_when_number_of_seats_is_five
      booking_request = BookingRequest.new('(1,84:5,84:9)')
      assert Validations::SeatQuantity.valid?(booking_request)
    end

    def test_valid_when_number_of_seats_is_more_than_five
      booking_request = BookingRequest.new('(1,84:5,84:15)')
      assert_equal false, Validations::SeatQuantity.valid?(booking_request)
    end
  end
end
