# frozen_string_literal: true
require "tado_api/client"
require "tado_api/configuration"
require "tado_api/connection"
require "tado_api/requestable"
require "tado_api/temperature"

module TadoApi
  # Retrieve the current instance of configuration
  # @return [TadoApi::Configuration]
  #
  # @see TadoApi::Configuration
  #
  # @api public
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Assign an instance of configuration
  # @param config
  #   instance of [TadoApi::Configuration]
  #
  # @api public
  def self.configuration=(config)
    @configuration = config
  end

  # Yields the current instance of configuration to perform multiple assignments
  #
  # @see TadoApi::Configuration
  #
  # @example
  #   TadoApi.configure do |config|
  #     # ...
  #   end
  #
  # @api public
  def self.configure
    yield configuration
  end

  def self.build_from_env
    username = ENV.fetch("TADO_USERNAME")
    password = ENV.fetch("TADO_PASSWORD")
    home_id = ENV.fetch("TADO_HOME_ID")

    create_client(username: username, password: password, home_id: home_id)
  end

  # TODO
  def self.create_client(username:, password:, home_id:)
    @client ||= Client.new(username: username, password: password, home_id: home_id)
  end
end
