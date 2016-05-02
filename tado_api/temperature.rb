module TadoApi
  class Temperature
    attr_reader :float_value, :scale

    def initialize(raw_value:, scale: :celsius)
      @raw_value = raw_value
      @float_value = @raw_value.to_f rescue 0.0
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
  end
end
