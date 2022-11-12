class Pet
  attr_reader :hunger, :health, :hygiene, :fun, :name, :energy, :life

  def initialize(name)
    @name    = name
    @life    = 5
    @health  = 80
    @hunger  = 80
    @hygiene = 80
    @fun     = 80
    @energy  = 80

    def feed
      @hunger  += rand(15)
      @health  += rand(5)
      @hygiene -= rand(10)
      check
    end

    def play
      @fun     += rand(15)
      @health  -= rand(10)
      @hygiene -= rand(5)
      @energy  -= rand(15)
      check
    end

    def clean
      @hygiene += rand(20)
      @fun     += rand(10)
      @health  += rand(5)
      check
    end

    def walk
      @health  += rand(5)
      @fun     += rand(20)
      @hygiene -= rand(20)
      @energy  -= rand(15)
      check
    end

    def vet
      @health  += rand(20)
      @hunger  -= rand(5)
      @hygiene += rand(5)
      @fun     -= rand(20)
      check
    end

    def sleep
      @hunger -= rand(10)
      @energy += rand(20)
      check
    end

    def wait
      @health  -= rand(5)
      @hunger  -= rand(5)
      @hygiene -= rand(5)
      @fun     -= rand(5)
      @energy  -= rand(5)
      check
    end
  end

  def check
    @life  -= 1 if @health.negative?
    @life  -= 1 if @hunger.negative?
    @life  -= 1 if @hygiene.negative?
    @life  -= 1 if @fun.negative?
    @life  -= 1 if @energy.negative?
  end

  def alive
    @life.positive?
  end

end
