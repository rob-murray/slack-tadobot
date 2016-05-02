require "tado_api/error_response"
require "tado_api/status_response"
require "tado_api/success_response"
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

    def set_manual_mode(action:, temperature: 21.0)
      case action
      when :on
        enable_manual_mode(temperature)
      when :off
        disable_manual_mode
      end
    end

    private

    attr_reader :home_id

    def connection
      @connection ||= Connection.new(api_host: "https://my.tado.com")
    end

    def auth_params
      @auth_params ||= { username: @username, password: @password }
    end

    # omg what have tado done with their apis
    def enable_manual_mode(temperature_request)
      serialized_auth_params = parameterize(auth_params)
      raw_response = connection.put "/api/v2/homes/#{home_id}/zones/1/overlay?#{serialized_auth_params}",
        manual_mode_request_params(temperature_request)
      if raw_response.success?
        SuccessResponse.new(raw_response.body)
      else
        ErrorResponse.new(raw_response.body)
      end
    end

    def manual_mode_request_params(temperature_request)
      temperature = Temperature.new(raw_value: temperature_request)

      {
        setting: {
          type: "HEATING",
          power: "ON",
          temperature: temperature.to_params
        },
        termination: { type: "MANUAL" }
      }
    end

    def disable_manual_mode
      raw_response = connection.delete "/api/v2/homes/#{home_id}/zones/1/overlay", auth_params
      if raw_response.success?
        SuccessResponse.new(raw_response.body)
      else
        ErrorResponse.new(raw_response.body)
      end
    end

    def parameterize(params)
      URI.escape( params.map{ |k,v| "#{k}=#{v}" }.join('&') )
    end
  end
end
