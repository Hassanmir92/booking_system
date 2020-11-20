# frozen_string_literal: true

require_relative 'test_helper'

class BookingRequestsFactoryTest < Minitest::Test
  def test_build
    booking_requests = BookingRequestsFactory.build(File.open('test/fixtures/sample_booking_requests').read)

    assert_equal 500, booking_requests.count
    assert_equal '(0,47:39,47:41)', booking_requests.first.request
    assert_equal '(499,42:18,42:21)', booking_requests.last.request
  end
end
