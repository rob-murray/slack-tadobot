module TadoApi
  class ErrorResponse
    def initialize(response)
      @response =  response
    end

    def success?
      false
    end
  end
end
