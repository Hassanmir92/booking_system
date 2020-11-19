# frozen_string_literal: true

class Seat
  attr_reader :seat_index, :seat_row_index

  def initialize(seat_index, seat_row_index)
    @seat_index = seat_index
    @seat_row_index = seat_row_index
  end
end
