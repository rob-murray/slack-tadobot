# frozen_string_literal: true
$LOAD_PATH.unshift(File.dirname(__FILE__))

require "slack-tadobot"
require "web"

Thread.new do
  begin
    SlackTadobot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackTadobot::Web
