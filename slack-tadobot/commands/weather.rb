require "slack-tadobot/presenters/tado_weather"

module SlackMathbot
  module Commands
    class Status < SlackRubyBot::Commands::Base

      command 'weather' do |client, data, _match|
        response = SlackMathbot::Presenters::TadoWeather.new

        client.say(channel: data.channel, text: response.weather_to_messages, gif: response.condition_gif_tag)
      end
    end
  end
end
