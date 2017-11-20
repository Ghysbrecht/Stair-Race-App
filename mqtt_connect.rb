require 'mqtt'

client = MQTT::Client.connect(
	host: abcedefghijkl.iot.us-west-2.amazonaws.com, # Your AWS IoT host
	port: 8883,
	ssl: true,
	cert_file: “the path to 'Certificate file' ”,
	key_file: “the path to 'Private key file' ”,
	ca_file: “the path to 'Root CA certificate file’ ”
)