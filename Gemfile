# frozen_string_literal: true
source "https://rubygems.org"

ruby "2.3.1"

gem "slack-ruby-bot", github: "dblock/slack-ruby-bot" # TODO: fix this at a version
gem "celluloid-io"

gem "sinatra"
gem "puma"

gem "faraday_middleware"
gem "faraday_middleware-multi_json"

group :development, :test do
  gem "rake", "~> 10"
end

group :development do
  gem "foreman"
end
