# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/booking_system'

class BookingSystemTest < Minitest::Test
  def setup
    @booking_system = BookingSystem.new
  end

  def test_number_of_rejected_bookings
    assert_equal 10, @booking_system.number_of_rejected_bookings
  end
end
