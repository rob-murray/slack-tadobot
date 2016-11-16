# frozen_string_literal: true
require "slack-tadobot/presenters/tado_weather"

module SlackTadobot
  module Commands
    class Status < SlackRubyBot::Commands::Base
      match(/weather/) do |client, data, _match|
        response = SlackTadobot::Presenters::TadoWeather.new

        client.say(channel: data.channel, text: response.weather_to_messages)
      end

      match(/^show me the weather$/) do |client, data, _match|
        response = SlackTadobot::Presenters::TadoWeather.new

        client.say(channel: data.channel, text: response.weather_to_messages, gif: response.condition_gif_tag)
      end
    end
  end
end
