require "slack-tadobot/presenters/tado_status"

module SlackMathbot
  module Commands
    class Status < SlackRubyBot::Commands::Base

      command 'status' do |client, data, _match|
        response = SlackMathbot::Presenters::TadoStatus.new

        client.say(channel: data.channel, text: response.status_to_messages)
      end
    end
  end
end
