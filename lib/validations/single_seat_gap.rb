# frozen_string_literal: true

module Validations
  # This class is responsible for checking the validation of the booking leaves
  # a single seat gap in the theatre given the booking request
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
      !single_gap_before_first_seat? && !single_gap_after_last_seat?
    end

    private

    def single_gap_before_first_seat?
      one_seat_before_the_first_seat_available? && !two_seat_before_the_first_seat_available?
    end

    def single_gap_after_last_seat?
      one_seat_after_the_last_seat_available? && !two_seat_after_the_last_seat_available?
    end

    def one_seat_before_the_first_seat_available?
      theatre.reserved_seats.find do |reserved_seat|
        reserved_seat.seat_row_index == booking_request.first_seat_row_index &&
          reserved_seat.seat_index == booking_request.first_seat_index - 1
      end.nil?
    end

    def two_seat_before_the_first_seat_available?
      theatre.reserved_seats.find do |reserved_seat|
        reserved_seat.seat_row_index == booking_request.first_seat_row_index &&
          reserved_seat.seat_index == booking_request.first_seat_index - 2
      end.nil?
    end

    def one_seat_after_the_last_seat_available?
      theatre.reserved_seats.find do |reserved_seat|
        reserved_seat.seat_row_index == booking_request.last_seat_row_index &&
          reserved_seat.seat_index == booking_request.last_seat_index + 1
      end.nil?
    end

    def two_seat_after_the_last_seat_available?
      theatre.reserved_seats.find do |reserved_seat|
        reserved_seat.seat_row_index == booking_request.last_seat_row_index &&
          reserved_seat.seat_index == booking_request.last_seat_index + 2
      end.nil?
    end
  end
end
