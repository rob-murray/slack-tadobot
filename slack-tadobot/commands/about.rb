module SlackTadobot
  module Commands
    class Default < SlackRubyBot::Commands::Default
      def self.call(client, data, _match)
        client.say(channel: data.channel, text: SlackTadobot::ABOUT, gif: 'selfie')
      end
    end
  end
end
