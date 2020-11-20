# frozen_string_literal: true

require_relative 'theatre'
require_relative 'booking_requests_factory'

# This class is responsible for processing the booking system given a file path
# with booking request lines
class BookingSystem
  attr_reader :booking_requests, :rejected_requests

  def self.process(requests_file_path)
    new(File.open(requests_file_path).read).process
  end

  def initialize(content)
    @booking_requests = BookingRequestsFactory.build(content)
    @rejected_requests = []
  end

  def process
    @theatre = Theatre.new

    @booking_requests.each do |booking_request|
      rejected_requests.push(booking_request) unless @theatre.accept_booking(booking_request)
    end

    self
  end

  def number_of_rejected_bookings
    @rejected_requests.count
  end
end
