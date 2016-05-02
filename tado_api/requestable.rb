require "tado_api/client"

module TadoApi
  module Requestable
    def client
      @client ||= Client.new(username: username, password: password, home_id: home_id)
    end

    private

    def username
      ENV.fetch("TADO_USERNAME")
    end

    def password
      ENV.fetch("TADO_PASSWORD")
    end

    def home_id
      ENV.fetch("TADO_HOME_ID")
    end
  end
end
