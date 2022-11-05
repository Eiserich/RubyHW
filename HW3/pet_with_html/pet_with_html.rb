require 'KraVs'

class Pet
  attr_accessor :hunger, :health, :hygiene, :fun, :name

  def initialize
    @name    = name
    @health  = health
    @hunger  = hunger
    @hygiene = hygiene
    @fun     = fun
  end

  def new_game
    Pet.new
    Pet.start
    Pet.care
    puts 'Game over.'
  end

  def self.start
    puts 'You are walking in the park when suddenly you hear a noise.'
    puts 'It is coming from the bushes behind you!'
    puts 'Do you want to check it out? (Yes/No)'
    answer = gets.chomp.capitalize
    case answer
    when 'Yes'
      puts 'You walk up to the bushes and...'
      puts 'You found a dog.'
      @health  = rand(50..89)
      @hunger  = rand(50..89)
      @hygiene = rand(50..89)
      @fun     = rand(50..89)
      name_pet
      Pet.menu
      Pet.status(@name)
    when 'No'
      puts 'You start to walk away but something starts to follow you.'
      puts 'You turn around and see a dog looking at you sadly because of your choose.'
      @health  = rand(30..49)
      @hunger  = rand(30..49)
      @hygiene = rand(30..49)
      @fun     = rand(30..49)
      name_pet
      Pet.menu
      Pet.status(@name)
    else
      puts 'Invalid input. Try again'
    end
  end

  def self.menu
    puts "Select your option:
    1:    Clean your pet
    2:    Feed your pet
    3:    Play with your pet
    4:    Walk with your pet
    5:    Take your pet to the vet
    6:    Look at your pet and
    Help: Look at your options
    Exit: to exit the game
    B: to open in browser"
  end

  def self.care
    while alive
      answer2 = gets.chomp.capitalize
      break if answer2 == 'Exit'

      case answer2
      when '1'
        Pet.clean
        puts 'You clean your pet.'
        Pet.status(@name)
        Pet.time_pass

      when '2'
        Pet.feed
        puts 'Your feed your pet.'
        Pet.status(@name)
        Pet.time_pass

      when '3'
        Pet.play
        puts 'You play with your pet.'
        Pet.status(@name)
        Pet.time_pass

      when '4'
        Pet.walk
        puts 'You walk with your pet.'
        Pet.status(@name)
        Pet.time_pass

      when '5'
        Pet.vet
        puts 'You take your pet to the vet.'
        Pet.status(@name)
        Pet.time_pass

      when '6'
        Pet.look
        puts 'You look at your pet.'
        Pet.status(@name)
        Pet.time_pass

      when 'Help'
        Pet.menu
        Pet.status(@name)

      when 'B'
        system('open ./index.html')
      else
        puts 'Invalid input. Try again.'
      end
    end
  end

  def self.name_pet
    puts 'What do you you wanna name your pet?'
    @name = gets.chomp.capitalize
    puts "#{@name} looks at you happily."
  end

  def self.status(_name)
    puts "Health:   #{@health}"
    puts "Hunger:   #{@hunger}"
    puts "Hygiene:  #{@hygiene}"
    puts "Fun:      #{@fun}"
  end

  def self.alive
    @health.positive?
  end

  def self.feed
    @hunger  += rand(15)
    @health  += rand(5)
    @hygiene -= rand(10)
  end

  def self.play
    @fun     += rand(15)
    @health  -= rand(10)
    @hygiene -= 5
    return unless @hygiene.negative?

    @health   = 0
  end

  def self.clean
    @hygiene += rand(20)
    @fun     += rand(10)
    @health  += rand(5)
  end

  def self.walk
    @health  += rand(5)
    @fun     += rand(20)
    @hygiene -= rand(20)
  end

  def self.vet
    @health  += rand(20)
    @hunger  -= rand(5)
    @hygiene += rand(5)
    @fun     -= rand(20)
  end

  def self.look
    @health  -= rand(5)
    @hunger  -= rand(5)
    @hygiene -= rand(5)
    @fun     -= rand(5)
  end

  def self.time_pass
    @hygiene -= rand(10)
    @health   = 0 if @hygiene.negative?
    @fun -= rand(10)
    @health = 0 if @fun.negative?
    @hunger -= rand(10)
    @health  = 0 if @hunger.negative?
    @health -= rand(10)
    KraVs.save(info_html, file_name: 'index.html', bypass_html: true)
    if @health >= 80
      @health_unicode_status = '&#128522;'
    elsif @health <= 50
      @health_unicode_status = '&#128528;'
    elsif @health <= 30
      @health_unicode_status = '&#9785;'
    elsif @health.zero?
      @health_unicode_status = '&#9760;'
    end
  end
end

def info_html
  <<~HTML
    <p style="color:#000000; text-align: center; font-size: 32px; font-family: Menlo, serif">Name:                    #{@name}</p>
    <p style="color:#000000; text-align: center; font-size: 32px; font-family: Menlo, serif">Health:                  #{@health}</p>
    <p style="color:#000000; text-align: center; font-size: 32px; font-family: Menlo, serif">Hunger:                  #{@hunger}</p>
    <p style="color:#000000; text-align: center; font-size: 32px; font-family: Menlo, serif">Hygiene:                 #{@hygiene}</p>
    <p style="color:#000000; text-align: center; font-size: 32px; font-family: Menlo, serif">Fun:                     #{@fun}</p>
    <p style="text-align: center; font-size: 64px">#{@health_unicode_status}</p>
  HTML
end

class Game
  def initialize
    @pet = Pet.new
    @pet.new_game
  end
end

Game.new
