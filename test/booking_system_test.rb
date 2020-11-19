# frozen_string_literal: true

require_relative 'test_helper'

class BookingSystemTest < Minitest::Test
  def setup
    @booking_system = BookingSystem.process('test/fixtures/sample_booking_requests')
  end

  def test_number_of_rejected_bookings
    assert_equal 10, @booking_system.number_of_rejected_bookings
  end

  def test_booking_request_texts
    assert_equal 500, @booking_system.booking_requests_texts.count
    assert_equal '(0,47:39,47:41)', @booking_system.booking_requests_texts.first
    assert_equal '(499,42:18,42:21)', @booking_system.booking_requests_texts.last
  end
end
