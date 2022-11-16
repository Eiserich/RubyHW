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

    when "/" then rack_response("pet_name.html.erb")

    when "/create_pet" then name = request.params["name"]
    return response_redirect("/") if name.nil? || name.length.zero?
    @pet = Pet.new(name)
    response_redirect("/game")

    when "/game"
      return response_redirect("/") if pet.nil?
      rack_response("index.html.erb")

    when "/feed"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.feed
        rack_response("index.html.erb")
      else
        response_redirect("/game_over")
      end

    when "/play"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.play
        rack_response("index.html.erb")
      else
        response_redirect("/game_over")
      end

    when "/clean"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.clean
        rack_response("index.html.erb")
      else
        response_redirect("/game_over")
      end

    when "/walk"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.walk
        rack_response("index.html.erb")
      else
        response_redirect("/game_over")
      end

    when "/vet"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.vet
        rack_response("index.html.erb")
      else
        response_redirect("/game_over")
      end

    when "/sleep"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.sleep
        rack_response("index.html.erb")
      else
        response_redirect("/game_over")
      end

    when "/game_over"
      @pet = nil
      rack_response("the_end.html.erb")
    else response_redirect("/")
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def rack_response(template)
    Rack::Response.new(render(template))
  end

  def response_redirect(path)
    Rack::Response.new do |response|
      response.redirect(path)
    end
  end
end
