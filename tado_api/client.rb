require "tado_api/status_response"
require "tado_api/error_response"
require "tado_api/weather_response"

module TadoApi
  class Client
    def initialize(username:, password:, home_id:)
      @username, @password, @home_id = username, password, home_id
    end

    def current_state
      raw_response = connection.get "/mobile/1.6/getCurrentState", auth_params
      if raw_response.success?
        StatusResponse.new(raw_response.body)
      else
        ErrorResponse.new(raw_response.body)
      end
    end

    def current_weather
      raw_response = connection.get "/mobile/1.6/getCurrentWeather", auth_params
      if raw_response.success?
        WeatherResponse.new(raw_response.body)
      else
        ErrorResponse.new(raw_response.body)
      end
    end

    private

    def connection
      @connection ||= Connection.new(api_host: "https://my.tado.com")
    end

    def auth_params
      @auth_params ||= { username: @username, password: @password }
    end
  end
end
