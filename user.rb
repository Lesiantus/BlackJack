class User
  attr_reader :name, :bank, :cards

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
      puts 'у вас закончились деньги'
    end
  end

  def win(value)
    @bank += value
  end

  def total
    aces_count = @cards.count { |card| card.value == 11 }
    total = @cards.inject(0) { |sum, card| sum + card.value }
    aces_count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def string_view
    a = ''
    @cards.each do |card|
      a += "#{card.suit} #{card.num}"
    end
    a
  end
end
