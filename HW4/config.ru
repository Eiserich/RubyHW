# frozen_string_literal: true

require './lib/app'
require 'rack'

use Rack::Reloader, 0
use Rack::Auth::Basic do |username, password|
  username == 'Gamer' && password == 'password'
end

run App.new
