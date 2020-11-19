# frozen_string_literal: true

module Validations
  # This class is responsible for checking the validation of the booking request string
  class RequestFormat
    attr_reader :request

    def self.valid?(request)
      new(request).valid?
    end

    def initialize(request)
      @request = request
    end

    def valid?
      request.match?(/[(][0-9]+,[0-9]{1,2}:[0-9]{1,2},[0-9]{1,2}:[0-9]{1,2}[)]/)
    end
  end
end
