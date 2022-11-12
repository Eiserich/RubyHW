require 'erb'
class App

  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def response
    case @request.path

    when "/" then Rack::Response.new(render("login.html.erb"))

    when "/initialize"
      Rack::Response.new do |response|
        response.set_cookie("health", 100)
        response.set_cookie("hunger", 100)
        response.set_cookie("hygiene", 100)
        response.set_cookie("fun", 100)
        response.set_cookie("energy", 100)
        response.redirect('/start')
      end

    when "/start" then Rack::Response.new(render("index.html.erb"))

    when "/exit" then Rack::Response.new(render("the_end.htm.erb"))
    else
    Rack::Response.new("Not Found", 404)
    end
    end

    def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
    end
  end
