require 'mqtt'
require 'yaml'
require 'json'
require 'base64'
TTN_CONFIG = YAML.load_file("#{::Rails.root}/config/ttn.yml")

Rails.application.config.ttn = TTN_CONFIG

module StairRaceApp
  class Application < Rails::Application
    config.before_initialize do
      Rails.logger.debug { "spawning new threat" }
      Thread.new do
        Rails.logger.debug { "connecting to ttn" }
        client = MQTT::Client.connect(TTN_CONFIG['server'])
        Rails.logger.debug { "connected ttn" }
        client.get('vivesiotstairrace/#') do |topic,message|
          Rails.logger.debug { "received ttn message" }
          Rails.logger.debug { message }
          begin
            message = JSON.parse(message)
          rescue => ex
            Rails.logger.error ex.message
          end
          Rails.logger.debug { message }
          Leaderboard.new.mqtt(message)
        end
      end
    end
  end
end
