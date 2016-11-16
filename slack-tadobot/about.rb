# frozen_string_literal: true
require_relative "tag_line"

module SlackTadobot
  ABOUT = <<-ABOUT
    #{SlackTadobot::TAG_LINE}
    https://github.com/rob-murray/slack-tadobot
    #{SlackTadobot::VERSION}
  ABOUT
end
