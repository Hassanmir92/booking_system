# frozen_string_literal: true

require_relative 'seat'
require_relative 'validations/same_row_seat'
require_relative 'validations/seat_availabilities'
require_relative 'validations/seat_existance'
require_relative 'validations/seat_quantity'
require_relative 'validations/single_seat_gap'

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

  private

  def can_accept_request?
    booking_request.valid_format? &&
      seats_exist? &&
      seats_on_the_same_row? &&
      fewer_than_or_equal_to_five_seats? &&
      all_seats_currently_available? &&
      does_not_leave_single_seat_gap?
  end

  def seats_exist?
    Validations::SeatExistance.valid?(booking_request)
  end

  def seats_on_the_same_row?
    Validations::SameRowSeat.valid?(booking_request)
  end

  def fewer_than_or_equal_to_five_seats?
    Validations::SeatQuantity.valid?(booking_request)
  end

  def all_seats_currently_available?
    Validations::SeatAvailabilities.valid?(theatre, booking_request)
  end

  def does_not_leave_single_seat_gap?
    Validations::SingleSeatGap.valid?(theatre, booking_request)
  end
end
