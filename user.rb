class User
  attr_reader :name, :bank, :cards
  def initialize(name)
    @name = name
    @cards = []
    @bank = 100
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

  def points
    @cards_value = 0
    hand = @cards.map(&:chop)
    hand.each do |card|
      @cards_value += card.to_i
    end
  end



end
