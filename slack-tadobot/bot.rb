# frozen_string_literal: true
module SlackTadobot
  class Bot < SlackRubyBot::Bot
    help do
      title "slack-tadobot"
      desc SlackTadobot::TAG_LINE

      command "status" do
        desc "Show the current status of your Tado."
      end

      command "how are you?" do
        desc "Ask the status of your Tado."
      end

      command "weather" do
        desc "Show the current weather at the Tado device location."
      end

      command "set manual on <temperature>" do
        desc "Set the heating manual override on to a specific temperature."
      end

      command "set manual off" do
        desc "Set the heating manual override off."
      end
    end
  end
end
