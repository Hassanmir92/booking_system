# frozen_string_literal: true

require_relative 'seat'

class Booking
  attr_reader :booking_request, :theatre, :seats

  def initialize(theatre, booking_request)
    @theatre = theatre
    @booking_request = booking_request
    @seats = []
  end

  def accept_request
    return false unless can_accept_request?

    (booking_request.first_seat_index..booking_request.last_seat_index).map do |seat_index|
      @seats.push(Seat.new(seat_index, booking_request.first_seat_row_index))
    end
  end

  def can_accept_request?
    seats_exist? &&
      seats_on_the_same_row? &&
      fewer_than_or_equal_to_five_seats? &&
      all_seats_currently_available? &&
      does_not_leave_single_seat_gap?
  end

  def seats_exist?
    booking_request.first_seat_row_index <= 99 &&
      booking_request.last_seat_row_index <= 99 &&
      booking_request.first_seat_index <= 49 &&
      booking_request.last_seat_index <= 49
  end

  def seats_on_the_same_row?
    booking_request.first_seat_row_index == booking_request.last_seat_row_index
  end

  def fewer_than_or_equal_to_five_seats?
    ((booking_request.last_seat_index - booking_request.first_seat_index) + 1) <= 5
  end

  def all_seats_currently_available?
    (booking_request.first_seat_index..booking_request.last_seat_index).map do |seat_index|
      theatre.reserved_seats.none? do |reserved_seat|
        reserved_seat.seat_index == seat_index &&
          reserved_seat.seat_row_index == booking_request.first_seat_row_index
      end
    end.all?
  end

  def does_not_leave_single_seat_gap?
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
