class User
  attr_reader :name, :bank
  def initialize(name)
    @name = name
    @cards = []
    @bank = 100
  end

  def bet
    @bank-=10
  end

  def win
    @bank+=20
  end

end
