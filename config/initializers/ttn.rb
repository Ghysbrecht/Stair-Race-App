require 'mqtt'
require 'yaml'
require 'json'
require 'base64'
TTN_CONFIG = YAML.load_file("#{::Rails.root}/config/ttn.yml")

Rails.application.config.ttn = TTN_CONFIG



Rails.application.config.after_initialize do
    Thread.new do
        client = MQTT::Client.connect(TTN_CONFIG['server'])
        client.get('+/devices/+/up') do |topic,message|
            puts message
            message = JSON.parse(message)
            puts message
            message["decoded_payload"] = Base64.decode64(message["payload"])
            ActionCable.server.broadcast "lora", message: message
        end
    end
end