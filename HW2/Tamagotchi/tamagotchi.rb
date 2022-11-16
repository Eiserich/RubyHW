# frozen_string_literal: true

class Pet
  attr_accessor :hunger, :health, :hygiene, :fun, :name, :energy, :life

  def initialize
    @name    = name
    @life    = 5
    @health  = health
    @hunger  = hunger
    @hygiene = hygiene
    @fun     = fun
    @energy  = energy
  end

  def start
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
      @energy  = rand(50..89)
      name_pet
      menu
      status(@name)
    when 'No'
      puts 'You start to walk away but something starts to follow you.'
      puts 'You turn around and see a dog looking at you sadly because of your choose.'
      @health  = rand(30..49)
      @hunger  = rand(30..49)
      @hygiene = rand(30..49)
      @fun     = rand(30..49)
      @energy  = rand(30..49)
      name_pet
      menu
      status(@name)
    else
      puts 'Invalid input. Try again'
    end
  end

  def menu
    puts "Select your option:
    1:    Clean your pet
    2:    Feed your pet
    3:    Play with your pet
    4:    Walk with your pet
    5:    Take your pet to the vet
    6:    Put your pet to bed
    7:    Look at your pet and
    Help: Look at your options
    Exit: Exit the game"

    command = gets.chomp.capitalize

    while alive
      break if command == 'Exit'

      case command
      when '1'
        clean
        puts 'You clean your pet.'
        status(@name)
        time_pass

      when '2'
        feed
        puts 'Your feed your pet.'
        status(@name)
        time_pass

      when '3'
        play
        puts 'You play with your pet.'
        status(@name)
        time_pass

      when '4'
        walk
        puts 'You walk with your pet.'
        status(@name)
        time_pass

      when '5'
        vet
        puts 'You take your pet to the vet.'
        status(@name)
        time_pass

      when '6'
        sleep
        puts 'You put your pet to bed.'
        status(@name)
        time_pass

      when '7'
        look
        puts 'You look at your pet.'
        status(@name)
        time_pass

      when 'Help'
        menu
        status(@name)
      else
        puts 'Invalid input. Try again.'
      end
      command = gets.chomp.capitalize
    end
  end

  def name_pet
    puts 'What do you you wanna name your pet?'
    @name = gets.chomp.capitalize
    puts "#{@name} looks at you happily."
  end

  def status(_name)
    puts "Life:     #{@life}"
    puts "Health:   #{@health}"
    puts "Hunger:   #{@hunger}"
    puts "Hygiene:  #{@hygiene}"
    puts "Fun:      #{@fun}"
    puts "Energy:   #{@energy}"
  end

  def alive
    @life.positive?
  end

  def feed
    @hunger  += rand(15)
    @health  += rand(5)
    @hygiene -= rand(10)
  end

  def play
    @fun     += rand(15)
    @health  -= rand(10)
    @hygiene -= rand(5)
    @energy  -= rand(15)
  end

  def clean
    @hygiene += rand(20)
    @fun     += rand(10)
    @health  += rand(5)
  end

  def walk
    @health  += rand(5)
    @fun     += rand(20)
    @hygiene -= rand(20)
    @energy  -= rand(15)
  end

  def vet
    @health  += rand(20)
    @hunger  -= rand(5)
    @hygiene += rand(5)
    @fun     -= rand(20)
  end

  def sleep
    @hunger -= rand(10)
    @energy += rand(20)
  end

  def look
    @health  -= rand(5)
    @hunger  -= rand(5)
    @hygiene -= rand(5)
    @fun     -= rand(5)
    @energy  -= rand(5)
  end

  private

  def time_pass
    @hygiene -= rand(10)
    @life    -= 1 if @hygiene.negative?
    @fun     -= rand(10)
    @life    -= 1 if @fun.negative?
    @hunger  -= rand(10)
    @life    -= 1 if @hunger.negative?
    @energy  -= rand(10)
    @life    -= 1 if @energy.negative?
    @health  -= rand(10)
    @life    -= 1 if @health.negative?
  end
end
pet = Pet.new
pet.start
