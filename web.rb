# frozen_string_literal: true
require "sinatra/base"
require "slack-tadobot/tag_line"

module SlackTadobot
  class Web < Sinatra::Base
    get "/" do
      SlackTadobot::TAG_LINE
    end
  end
end
