require "erb"
require_relative "pet"
require 'byebug'
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
    return response_redirect("/") if name.nil? || name.length.zero?
    @pet = Pet.new(name)
    response_redirect("/game")

    when "/game"
      return response_redirect("/") if pet.nil?
      Rack::Response.new(render("index.html.erb"))

    when "/feed"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.feed
      Rack::Response.new(render("index.html.erb"))
      else
        response_redirect("/game_over")
        end

    when "/play"
      return response_redirect("/") if pet.nil?
      if pet.alive
          pet.play
      Rack::Response.new(render("index.html.erb"))
          else
    response_redirect("/game_over")
    end

    when "/clean"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.clean
      Rack::Response.new(render("index.html.erb"))
        else
        response_redirect("/game_over")
        end

    when "/walk"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.walk
      Rack::Response.new(render("index.html.erb"))
        else
        response_redirect("/game_over")
        end

    when "/vet"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.vet
      Rack::Response.new(render("index.html.erb"))
        else
        response_redirect("/game_over")
        end

    when "/sleep"
      return response_redirect("/") if pet.nil?
      if pet.alive
        pet.sleep
      Rack::Response.new(render("index.html.erb"))
        else
        response_redirect("/game_over")
        end

    when "/game_over"
      @pet = nil
      response_redirect("/game_over")
    else response_redirect("/")
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
