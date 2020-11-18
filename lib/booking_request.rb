# frozen_string_literal: true

class BookingRequest
  attr_reader :request_array

  def initialize(request)
    @request_array = request.gsub(/[()]/, '').split(',')
  end

  def id
    request_array[0].to_i
  end

  def first_seat_row_index
    request_array[1].split(':')[0].to_i
  end

  def first_seat_index
    request_array[1].split(':')[1].to_i
  end

  def last_seat_row_index
    request_array[2].split(':')[0].to_i
  end

  def last_seat_index
    request_array[2].split(':')[1].to_i
  end
end
