require "erb"
require_relative "pet"
class App
  attr_reader :request, :path
  attr_accessor :pet
  def call(env)
    @request = Rack::Request.new(env)
    @path = request.path
    response.finish
  end

  def response
    case @request.path
    when "/" then Rack::Response.new(render("pet_name.html.erb"))
    when "/create_pet" then name = request.params["name"]
    @pet = Pet.new(name)
    when "/game" then Rack::Response.new(render("index.html.erb"))
    when "/feed"
      if pet.alive
      pet.feed
      Rack::Response.new(render("index.html.erb"))
      else
        response_redirect("the_end.html.erb")
        end
        when "/play"
        if pet.alive
          pet.play
      Rack::Response.new(render("index.html.erb"))
          else
    response_redirect("the_end.html.erb")
    end
      when "/clean"
      if pet.alive
        pet.clean
      Rack::Response.new(render("index.html.erb"))
        else
        response_redirect("the_end.html.erb")
        end
      when "/walk"
      if pet.alive
        pet.walk
      Rack::Response.new(render("index.html.erb"))
        else
        response_redirect("the_end.html.erb")
        end
      when "/vet"
      if pet.alive
        pet.vet
      Rack::Response.new(render("index.html.erb"))
        else
        response_redirect("the_end.html.erb")
        end
      when "/sleep"
      if pet.alive
        pet.sleep
      Rack::Response.new(render("index.html.erb"))
        else
        response_redirect("the_end.html.erb")
        end
      when "/wait"
      if pet.alive
        pet.wait
        else
      Rack::Response.new(render("index.html.erb"))
        response_redirect("the_end.html.erb")
      end
    when "/game_over"
      @pet = nil
      response_redirect("the_end.html.erb")
    else Rack::Response.new("Not Found", 404)
    end
  end

    def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
    end

  def response_redirect(path)
    Rack::Response.new do |response|
      response.redirect(path)
    end
    end

  end
