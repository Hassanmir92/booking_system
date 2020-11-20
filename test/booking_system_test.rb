# frozen_string_literal: true

require_relative 'test_helper'

class BookingSystemTest < Minitest::Test
  def setup
    @booking_system = BookingSystem.process('test/fixtures/sample_booking_requests')
  end

  def test_number_of_rejected_bookings
    assert_equal 10, @booking_system.number_of_rejected_bookings
  end

  def test_booking_request
    assert_equal 500, @booking_system.booking_requests.count
  end
end
