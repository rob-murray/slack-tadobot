require 'faraday_middleware'
require 'faraday_middleware/multi_json'

module TadoApi
  # @api private
  class Connection
    def initialize(configuration = {})
      @configuration = configuration
    end

    def get(url, params = {}, headers = {})
      request :get, url, params, headers
    end

    def post(url, params = {}, headers = {})
      request :post, url, params, headers
    end

    private

    attr_reader :configuration

    def connection
      @connection ||= Faraday.new(url: api_host) do |conn|
        conn.request  :multi_json
        conn.response :multi_json
        conn.adapter  Faraday.default_adapter
      end
    end

    def api_host
      configuration.fetch(:api_host)
    end

    def request(method, path, data, options = {})
      headers = default_headers.merge(options)

      connection.send(method, path, data, headers)
    end

    def default_headers
      {
        content_type: 'application/json',
        accept:       'application/json',
      }
    end
  end
end
