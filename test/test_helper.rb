# frozen_string_literal: true

gem 'minitest'
require 'minitest/autorun'

require_relative '../lib/validations/same_row_seat'
require_relative '../lib/validations/seat_availabilities'
require_relative '../lib/validations/seat_existance'
require_relative '../lib/validations/seat_quantity'
require_relative '../lib/validations/single_seat_gap'

require_relative '../lib/booking_request'
require_relative '../lib/booking_system'
require_relative '../lib/booking'
require_relative '../lib/seat'
require_relative '../lib/theatre'
