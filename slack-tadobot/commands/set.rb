module SlackTadobot
  module Commands
    class Set < SlackRubyBot::Commands::Base
      # TODO: refactor this hacky stuff

      command "set" do |client, data, match|
        if !match["expression"]
          client.say(channel: data.channel, text: "Missing setting, eg. _set manual on_.", gif: "help")
        else
          k, v, *rest = match["expression"].split(/\W+/)
          case k
          when "manual" then
            if v == "on"
              if temperature = match["expression"].match(/\d*\.?\d+$/)
                api_client = TadoApi.build_from_env
                api_response = api_client.set_manual_mode(action: :on, temperature: temperature[0])
                if api_response.success?
                  client.say(channel: data.channel, text: "Set manual mode on", gif: "boom")
                else
                  client.say(channel: data.channel, text: "Something went wrong", gif: "help")
                end
              else
                client.say(channel: data.channel, text: "cInvalid setting #{v}, you can _set manual on|off_.", gif: "help")
              end
            elsif v == "off"
              api_client = TadoApi.build_from_env
              api_response = api_client.set_manual_mode(action: :off)
              if api_response.success?
                client.say(channel: data.channel, text: "Set manual mode off", gif: "relax")
              else
                client.say(channel: data.channel, text: "Something went wrong", gif: "help")
              end
            else
              client.say(channel: data.channel, text: "bInvalid setting #{v}, you can _set manual on|off_.", gif: "help")
            end

          else
            client.say(channel: data.channel, text: "aInvalid setting #{k}, you can _set manual on|off_.", gif: "fail")
          end
        end
      end
    end
  end
end
