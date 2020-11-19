# frozen_string_literal: true

module Validations
  # This class is responsible for checking the validation of whether there are
  # more seats requested than the limitation given the booking request
  class SeatQuantity
    attr_reader :booking_request

    SEAT_QUANTITY_LIMIT = 5

    def self.valid?(booking_request)
      new(booking_request).valid?
    end

    def initialize(booking_request)
      @booking_request = booking_request
    end

    def valid?
      ((booking_request.last_seat_index - booking_request.first_seat_index) + 1) <= SEAT_QUANTITY_LIMIT
    end
  end
end
