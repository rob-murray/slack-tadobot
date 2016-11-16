# frozen_string_literal: true
require "tado_api/temperature"

module TadoApi
  class WeatherResponse
    def initialize(response)
      @data = response || {}
    end

    def success?
      true
    end

    def current_temperature
      to_temperature data["temperature"]
    end

    def location
      data["location"] || "Unknown"
    end

    private

    attr_reader :data

    def to_temperature(temperature_value)
      Temperature.new(raw_value: temperature_value)
    end
  end
end

__END__

{
          "success" => true,
      "temperature" => 12.949999809265137,
    "conditionCode" => 9,
         "dayPhase" => "DAY",
         "location" => "location name"
}
