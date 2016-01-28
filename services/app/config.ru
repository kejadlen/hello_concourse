require "json"

require_relative "app"

%w[ hello world ].each do |service|
  name = "#{service.upcase}_SERVICE"
  return ENV[name] if ENV[name] 
  
  json = JSON.load(ENV["VCAP_SERVICES"])
  service = json["user-provided"].find { |user_provided| user_provided["name"] == "#{service}_service" }
  ENV[name] = service["credentials"]["host"]
end

run App.new
