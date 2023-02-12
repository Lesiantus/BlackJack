class Card
  attr_accessor :value, :suit, :num

  def initialize(suit, num, value)
    @suit = suit
    @num = num
    @value = value
  end
end
