# frozen_string_literal: true

require_relative 'validations/request_format'

# This class represents the booking request and is responsible
# for building the methods of a booking request given a single string with a valid format
class BookingRequest
  attr_reader :request, :request_array

  def initialize(request)
    @request = request
    @request_array = request.gsub(/[()]/, '').split(',')
  end

  def valid_format?
    Validations::RequestFormat.valid?(request)
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
