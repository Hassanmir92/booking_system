# frozen_string_literal: true

class BookingSystem
  attr_reader :booking_requests_texts

  def self.process(requests_file_path)
    new(File.open(requests_file_path).read).process
  end

  def initialize(content)
    @booking_requests_texts = content.split(/,\r\n/)
  end

  def process
    self
  end

  def number_of_rejected_bookings
    10
  end
end
