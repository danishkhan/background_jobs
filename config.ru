require 'logger'
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../../lib'
require './app'
require 'resque/server'

use Rack::ShowExceptions

# Set the AUTH env variable to your basic auth password to protect Resque.
# AUTH_PASSWORD = ENV['AUTH']
AUTH_PASSWORD = "danish"
if AUTH_PASSWORD
  Resque::Server.use Rack::Auth::Basic do |username, password|
    password == AUTH_PASSWORD
  end
end

run Rack::URLMap.new \
  "/"       => Demo::App.new,
  "/resque" => Resque::Server.new