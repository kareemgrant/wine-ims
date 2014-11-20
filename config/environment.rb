# Load the Rails application.
require File.expand_path('../application', __FILE__)

begin
  APP_CONFIG = YAML.load_file("#{Rails.root}/config/application.yml")[Rails.env]
rescue
  ""
end

# Initialize the Rails application.
Rails.application.initialize!
