class Cards
  NUMBERS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITS = ["\u2664", "\u2661", "\u2662", "\u2667"].freeze


  def initialize
    @deck = self.class.numerized_deck
  end

  def take_card
    a=[]
    p a << @deck.shift
  end

  def self.numerized_deck
    @numerized_deck ||= begin
      deck = []
      NUMBERS.each do |num|
        SUITS.each { |suit| deck << "#{suit} #{num}" }
      end
      deck.shuffle!
    end
  end


end
