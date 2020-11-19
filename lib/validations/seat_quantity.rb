# frozen_string_literal: true

module Validations
  class SeatQuantity
    attr_reader :booking_request

    def self.valid?(booking_request)
      new(booking_request).valid?
    end

    def initialize(booking_request)
      @booking_request = booking_request
    end

    def valid?
      ((booking_request.last_seat_index - booking_request.first_seat_index) + 1) <= 5
    end
  end
end
