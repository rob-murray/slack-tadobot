# frozen_string_literal: true
module SlackTadobot
  module Presenters
    class HumanizedStatus < TadoStatus
      def status_to_messages
        if response.success?
          [
            response_for_temperature,
            response_for_heating
          ]
        else
          "I'm not very well, I can't really speak right now"
        end
      end

      private

      def response_for_temperature
        if response.current_temperature.value > 12
          "I'm feeling toasty at #{current_temperature}"
        else
          "I'm feeling a little chilly at #{current_temperature}"
        end
      end

      def response_for_heating
        if response.heating_on?
          "I'm heating up your house at the moment, would you like me to turn off?"
        else
          "I'm off at the moment, would you like to turn me on?"
        end
      end
    end
  end
end
