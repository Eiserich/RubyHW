require './lib/app'
require 'rack'

use Rack::Reloader, 0

run Rack::Cascade.new([Rack::File.new("public"), App])