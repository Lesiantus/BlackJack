# frozen_string_literal: true

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
    total = 0
    @cards.each do |a|
      total += a.value
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
