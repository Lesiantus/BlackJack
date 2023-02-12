class Card
  #PICTURES = %w(J Q K A).freeze
  attr_accessor :value

  def initialize(suit, num, value)
    @suit = suit
    @num = num
    @value = value
  end
end
