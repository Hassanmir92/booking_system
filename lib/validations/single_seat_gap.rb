# frozen_string_literal: true

module Validations
  class SingleSeatGap
    attr_reader :theatre, :booking_request

    def self.valid?(theatre, booking_request)
      new(theatre, booking_request).valid?
    end

    def initialize(theatre, booking_request)
      @theatre = theatre
      @booking_request = booking_request
    end

    def valid?
      one_seat_before_the_first_seat = theatre.reserved_seats.find do |reserved_seat|
        reserved_seat.seat_row_index == booking_request.first_seat_row_index &&
          reserved_seat.seat_index == booking_request.first_seat_index - 1
      end

      two_seat_before_the_first_seat = theatre.reserved_seats.find do |reserved_seat|
        reserved_seat.seat_row_index == booking_request.first_seat_row_index &&
          reserved_seat.seat_index == booking_request.first_seat_index - 2
      end

      one_seat_after_the_last_seat = theatre.reserved_seats.find do |reserved_seat|
        reserved_seat.seat_row_index == booking_request.last_seat_row_index &&
          reserved_seat.seat_index == booking_request.last_seat_index + 1
      end

      two_seat_after_the_last_seat = theatre.reserved_seats.find do |reserved_seat|
        reserved_seat.seat_row_index == booking_request.last_seat_row_index &&
          reserved_seat.seat_index == booking_request.last_seat_index + 2
      end

      !(one_seat_before_the_first_seat.nil? && !two_seat_before_the_first_seat.nil?) &&
        !(one_seat_after_the_last_seat.nil? && !two_seat_after_the_last_seat.nil?)
    end
  end
end
