# frozen_string_literal: true

require_relative 'theatre'
require_relative 'booking_request'

class BookingSystem
  attr_reader :booking_requests_texts

  def self.process(requests_file_path)
    new(File.open(requests_file_path).read).process
  end

  def initialize(content)
    @booking_requests_texts = content.split(/,\r\n/)
    @rejected_requests = []
  end

  def process
    @theatre = Theatre.new

    booking_requests_texts.each do |booking_request_text|
      booking_request = BookingRequest.new(booking_request_text)

      @rejected_requests.push(booking_request_text) unless @theatre.accept_booking(booking_request)
    end

    self
  end

  def number_of_rejected_bookings
    @rejected_requests.count
  end
end
