module SlackTadobot
  module Presenters
    class TadoStatus
      include ::TadoApi::Requestable

      def status_to_messages
        if response.success?
          [
            "The temperature is currently #{current_temperature}",
            "The set temperature is #{set_temperature}",
            "The heating is currently #{heating_on_or_off}"
          ]
        else
          ["Oops, something went wrong...", "I think Mercury is in retrograde or something."]
        end
      end

      def current_temperature
        response.current_temperature.formatted
      end

      def set_temperature
        response.set_temperature.formatted
      end

      def heating_on_or_off
        response.heating_on? ? "On" : "Off"
      end

      private

      def response
        response ||= client.current_state
      end
    end
  end
end
