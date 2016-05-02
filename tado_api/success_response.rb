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
