module SlackMathbot
  module Commands
    class Help < SlackRubyBot::Commands::Base
      HELP = <<-HELP.freeze
#{SlackTadobot::TAG_LINE}

```
TODO Usage commands here.
      HELP

      command 'help' do |client, data, _match|
        client.say(channel: data.channel, text: HELP, gif: 'help')
      end
    end
  end
end
