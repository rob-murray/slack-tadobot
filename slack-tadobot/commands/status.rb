require "slack-tadobot/presenters/tado_status"

module SlackTadobot
  module Commands
    class Status < SlackRubyBot::Commands::Base

      command 'status' do |client, data, _match|
        response = SlackTadobot::Presenters::TadoStatus.new

        client.say(channel: data.channel, text: response.status_to_messages)
      end
    end
  end
end
