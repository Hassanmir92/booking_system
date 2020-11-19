# frozen_string_literal: true

module Validations
  # This class is responsible for checking the validation of whether there are any
  # non-existant seats within the booking request
  class SeatExistance
    attr_reader :booking_request

    MAX_SEAT_ROW_INDEX = 99
    MAX_SEAT_INDEX = 49

    def self.valid?(booking_request)
      new(booking_request).valid?
    end

    def initialize(booking_request)
      @booking_request = booking_request
    end

    def valid?
      booking_request.first_seat_row_index <= MAX_SEAT_ROW_INDEX &&
        booking_request.last_seat_row_index <= MAX_SEAT_ROW_INDEX &&
        booking_request.first_seat_index <= MAX_SEAT_INDEX &&
        booking_request.last_seat_index <= MAX_SEAT_INDEX
    end
  end
end
