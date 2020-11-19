# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/booking'
require_relative '../lib/booking_request'
require_relative '../lib/theatre'

class BookingTest < Minitest::Test
  def setup
    @theatre = Theatre.new
  end

  def test_accept_request
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.accept_request
    assert_equal 3, booking.seats.count

    booking_request = BookingRequest.new('(1,84:49,84:51)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.accept_request
    assert_equal 0, booking.seats.count
  end

  def test_seats_exist?
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.seats_exist?

    booking_request = BookingRequest.new('(1,84:58,109:7)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.seats_exist?
  end

  def test_seats_on_the_same_row?
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.seats_on_the_same_row?

    booking_request = BookingRequest.new('(1,84:5,85:7)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.seats_on_the_same_row?
  end

  def test_fewer_than_or_equal_to_five_seats?
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.fewer_than_or_equal_to_five_seats?

    booking_request = BookingRequest.new('(1,84:5,84:9)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.fewer_than_or_equal_to_five_seats?

    booking_request = BookingRequest.new('(1,84:5,84:15)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.fewer_than_or_equal_to_five_seats?
  end

  def test_all_seats_currently_available?
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    booking = Booking.new(@theatre, booking_request)
    booking.accept_request
    @theatre.bookings.push(booking)

    booking_request = BookingRequest.new('(1,84:3,84:5)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.all_seats_currently_available?

    booking_request = BookingRequest.new('(1,84:5,84:7)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.all_seats_currently_available?

    booking_request = BookingRequest.new('(1,84:7,84:11)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.all_seats_currently_available?

    booking_request = BookingRequest.new('(1,84:25,84:28)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.all_seats_currently_available?

    booking_request = BookingRequest.new('(1,84:0,84:4)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.all_seats_currently_available?
  end

  def test_does_not_leave_single_seat_gap?
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    booking = Booking.new(@theatre, booking_request)
    booking.accept_request
    @theatre.bookings.push(booking)

    booking_request = BookingRequest.new('(1,84:0,84:3)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.does_not_leave_single_seat_gap?

    booking_request = BookingRequest.new('(1,84:9,84:11)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.does_not_leave_single_seat_gap?

    booking_request = BookingRequest.new('(1,84:8,84:11)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.does_not_leave_single_seat_gap?

    booking_request = BookingRequest.new('(1,84:0,84:4)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.does_not_leave_single_seat_gap?

    booking_request = BookingRequest.new('(1,84:0,84:2)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.does_not_leave_single_seat_gap?

    booking_request = BookingRequest.new('(1,84:10,84:11)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.does_not_leave_single_seat_gap?
  end
end
