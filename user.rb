class User
  attr_accessor :name, :bank, :cards
  def initialize(name)
    @name = name
    @cards = []
    @bank = 100
    @total = total
  end

  def bet
    if @bank >= 10
      @bank -= 10
    else
      puts "у вас закончились деньги"
    end
  end

  def win
    @bank += 20
  end

  def total
    total = 0
    @cards.each do |a|
      total += a.value
    end
    total
  end

end
