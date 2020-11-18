# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/booking_request'

class BookingRequestTest < Minitest::Test
  def setup
    @booking_request = BookingRequest.new('(1,84:5,84:7)')
  end

  def test_id
    assert_equal 1, @booking_request.id
  end

  def test_first_seat_row_index
    assert_equal 84, @booking_request.first_seat_row_index
  end

  def test_first_seat_index
    assert_equal 5, @booking_request.first_seat_index
  end

  def test_last_seat_row_index
    assert_equal 84, @booking_request.last_seat_row_index
  end

  def test_last_seat_index
    assert_equal 7, @booking_request.last_seat_index
  end
end
