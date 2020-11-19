# frozen_string_literal: true

module Validations
  # This class is responsible for checking the validation of whether the seats are on the same row
  # given the booking request
  class SameRowSeat
    attr_reader :booking_request

    def self.valid?(booking_request)
      new(booking_request).valid?
    end

    def initialize(booking_request)
      @booking_request = booking_request
    end

    def valid?
      booking_request.first_seat_row_index == booking_request.last_seat_row_index
    end
  end
end
