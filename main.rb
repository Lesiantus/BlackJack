require_relative 'user'
require_relative 'admin'
require_relative 'gamer'
require_relative 'cards'
require_relative 'card'


class Main

  BET = 10

  def initialize
    @dealer = Dealer.new
    @deck = Cards.new
    @bank = 20
  end

  def start
    name_input
  end


  def input_choice
    puts 'Введите номер операции'
    @choice = $stdin.gets.chomp.to_i
  end

  def name_input
    puts 'Введите свое имя, не оставляйте незаполненным'
    inp = $stdin.gets.chomp
    @gamer = Gamer.new(inp)
    start_game
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def start_game
    @gamer.cards << @deck.take_card
    @dealer.cards << @deck.take_card
    @gamer.cards << @deck.take_card
    @dealer.cards << @deck.take_card
    @gamer.bet
    @dealer.bet
    puts "Ваши карты: #{@gamer.cards}"
    puts "#{@gamer.total}"
    puts "Карты дилера: * * "
    puts @gamer.bank
  end


  def next_menu
  end



end
a=Main.new
a.start
