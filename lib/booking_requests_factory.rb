# frozen_string_literal: true

require_relative 'theatre'
require_relative 'booking_request'

# This class is building booking request objects given the request text content
class BookingRequestsFactory
  attr_reader :booking_requests_texts

  def self.build(content)
    new(content).build
  end

  def initialize(content)
    @booking_requests_texts = content.split(/,\r\n|\r\n/)
  end

  def build
    booking_requests_texts.map do |booking_request_text|
      BookingRequest.new(booking_request_text)
    end
  end
end
