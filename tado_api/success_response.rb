# frozen_string_literal: true
module TadoApi
  class SuccessResponse
    def initialize(response)
      @data = response || {}
    end

    def success?
      true
    end
  end
end
