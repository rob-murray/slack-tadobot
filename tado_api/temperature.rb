# frozen_string_literal: true
module TadoApi
  class Temperature
    attr_reader :float_value, :scale

    def initialize(raw_value:, scale: :celsius)
      @raw_value = raw_value
      @float_value = begin
                       @raw_value.to_f
                     rescue
                       0.0
                     end
      @scale = scale
    end

    def formatted
      "#{value} #{formatted_scale}"
    end

    def value
      float_value.round(2)
    end

    def formatted_scale
      scale == :celsius ? "°C" : "°F"
    end

    def to_params
      if scale == :celsius
        { celsius: value }
      else
        { fahrenheit: to_fahrenheit }
      end
    end

    private

    def to_fahrenheit
      (value * 1.8) + 32
    end
  end
end
