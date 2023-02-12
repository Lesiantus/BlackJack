require_relative 'card'
class Cards
  NUMBERS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITS = ["\u2664", "\u2661", "\u2662", "\u2667"].freeze

  attr_accessor :deck

  def initialize
    @deck = self.class.numerized_deck
  end

  def take_card
    @deck.shift
  end


  def self.numerized_deck
    @numerized_deck ||= begin
      deck = []
      NUMBERS.each do |num|
        if num.instance_of?(Integer)
          value = num
        elsif num == 'A'
          value = 11
        else
          value = 10
        end
        SUITS.each { |suit| deck << Card.new(suit, num, value) }
      end
      deck.shuffle!
    end
  end

end
