# frozen_string_literal: true

require_relative 'test_helper'

class BookingTest < Minitest::Test
  def setup
    @theatre = Theatre.new
  end

  def test_accept_request_when_can_be_accepted
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    booking = Booking.new(@theatre, booking_request)

    assert booking.accept_request
    assert_equal 3, booking.seats.count
  end

  def test_accept_request_when_request_format_validation_fails
    booking_request = BookingRequest.new('(1,84:5,85')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.accept_request
    assert_equal 0, booking.seats.count
  end

  def test_accept_request_when_seat_row_validation_fails
    booking_request = BookingRequest.new('(1,84:5,85:7)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.accept_request
    assert_equal 0, booking.seats.count
  end

  def test_accept_request_when_seat_existance_validation_fails
    booking_request = BookingRequest.new('(1,84:49,84:51)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.accept_request
    assert_equal 0, booking.seats.count
  end

  def test_accept_request_when_seat_availabilities_validation_fails
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    @theatre.accept_booking(booking_request)

    booking_request = BookingRequest.new('(1,84:3,84:5)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.accept_request
    assert_equal 0, booking.seats.count
  end

  def test_accept_request_when_seat_quantity_validation_fails
    booking_request = BookingRequest.new('(1,84:3,84:10)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.accept_request
    assert_equal 0, booking.seats.count
  end

  def test_accept_request_when_single_seat_gap_validation_fails
    booking_request = BookingRequest.new('(1,84:5,84:7)')
    @theatre.accept_booking(booking_request)

    booking_request = BookingRequest.new('(1,84:9,84:11)')
    booking = Booking.new(@theatre, booking_request)

    assert_equal false, booking.accept_request
    assert_equal 0, booking.seats.count
  end
end
