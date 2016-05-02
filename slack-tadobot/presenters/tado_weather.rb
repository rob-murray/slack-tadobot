module SlackTadobot
  module Presenters
    class TadoWeather
      include ::TadoApi::Requestable

      def weather_to_messages
        if response.success?
          "It is currently #{current_temp} in #{location}"
        else
          ["Oops, something went wrong...", "I think Mercury is in retrograde or something."]
        end
      end

      def condition_gif_tag
        if response.success?
          # TODO use the condition code
          "weather"
        else
          "fail"
        end
      end

      def current_temp
        response.current_temperature.formatted
      end

      def location
        response.location
      end

      private

      def response
        response ||= client.current_weather
      end
    end
  end
end
