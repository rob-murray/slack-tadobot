# frozen_string_literal: true
module SlackTadobot
  module Commands
    class About < SlackRubyBot::Commands::Default
      def self.call(client, data, _match)
        client.say(channel: data.channel, text: SlackTadobot::ABOUT)
      end
    end
  end
end
