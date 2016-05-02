require "tado_api/temperature"

module TadoApi
  class StatusResponse
    def initialize(response)
      @data = response || {}
    end

    def success?
      true
    end

    def current_temperature
      to_temperature data["insideTemp"]
    end

    def set_temperature
      to_temperature data["setPointTemp"]
    end

    def heating_on?
      !!data["heatingOn"]
    end

    private

    attr_reader :data

    def to_temperature(temperature_value)
      Temperature.new(raw_value: temperature_value)
    end
  end
end

__END__

{
                             "success" => true,
                           "operation" => "HOME",
                          "preheating" => false,
           "preheatingTargetOperation" => nil,
                       "autoOperation" => "HOME",
                    "operationTrigger" => "SYSTEM",
                          "insideTemp" => 17.44,
                        "setPointTemp" => 14,
                        "controlPhase" => "COOLDOWN",
           "currentUserPrivacyEnabled" => nil,
                 "currentUserGeoStale" => nil,
                      "deviceUpdating" => false,
                              "homeId" => XXXX,
                           "heatingOn" => false,
                 "internetGatewayType" => "GW02",
            "internetGatewayConnected" => true,
                   "heatingMuscleType" => "BU01",
              "heatingMuscleConnected" => true,
         "insideTemperatureSensorType" => "RU01",
    "insideTemperatureSensorConnected" => true,
                     "settingsEnabled" => true,
                   "fallbackOperation" => false,
                             "helpUrl" => "https://support.tado.com/hc/",
           "pendingDeviceInstallation" => false
}

