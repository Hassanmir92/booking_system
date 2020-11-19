# frozen_string_literal: true

require_relative '../test_helper'

module Validations
  class RequestFormatTest < Minitest::Test
    def test_valid_when_request_string_format_matches_expected
      assert Validations::RequestFormat.valid?('(1,84:5,84:7)')
    end

    def test_valid_when_request_string_is_missing_brackets
      assert_equal false, Validations::RequestFormat.valid?('1,84:5,84:7)')
      assert_equal false, Validations::RequestFormat.valid?('(1,84:5,84:7')
    end

    def test_valid_when_request_string_is_missing_id
      assert_equal false, Validations::RequestFormat.valid?('(,84:5,84:7)')
      assert_equal false, Validations::RequestFormat.valid?('(dd,84:5,84:7)')
    end

    def test_valid_when_request_string_has_invalid_seat_row_indexes
      assert_equal false, Validations::RequestFormat.valid?('(1,:5,84:7)')
      assert_equal false, Validations::RequestFormat.valid?('(1,84:5,:7)')

      assert_equal false, Validations::RequestFormat.valid?('(1,102:5,84:7)')
      assert_equal false, Validations::RequestFormat.valid?('(1,84:5,202:7)')

      assert_equal false, Validations::RequestFormat.valid?('(1,d:5,84:7)')
      assert_equal false, Validations::RequestFormat.valid?('(1,84:5,d:7)')
    end

    def test_valid_when_request_string_has_invalid_seat_indexes
      assert_equal false, Validations::RequestFormat.valid?('(1,84:,84:7)')
      assert_equal false, Validations::RequestFormat.valid?('(1,84:5,84:)')

      assert_equal false, Validations::RequestFormat.valid?('(1,84:100,84:7)')
      assert_equal false, Validations::RequestFormat.valid?('(1,84:5,84:100)')

      assert_equal false, Validations::RequestFormat.valid?('(1,84:d,84:7)')
      assert_equal false, Validations::RequestFormat.valid?('(1,84:5,84:d)')
    end
  end
end
