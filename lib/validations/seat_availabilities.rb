# frozen_string_literal: true

module Validations
  # This class is responsible for checking the validation of whether any of the seats
  # with the booking string are already reserved given the booking request and theatre
  class SeatAvailabilities
    attr_reader :theatre, :booking_request

    def self.valid?(theatre, booking_request)
      new(theatre, booking_request).valid?
    end

    def initialize(theatre, booking_request)
      @theatre = theatre
      @booking_request = booking_request
    end

    def valid?
      (booking_request.first_seat_index..booking_request.last_seat_index).map do |seat_index|
        theatre.reserved_seats.none? do |reserved_seat|
          reserved_seat.seat_index == seat_index &&
            reserved_seat.seat_row_index == booking_request.first_seat_row_index
        end
      end.all?
    end
  end
end
