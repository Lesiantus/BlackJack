require_relative 'user'
require_relative 'admin'
require_relative 'gamer'
require_relative 'cards'


class Main

  BET = 10

  def initialize
    @dealer = Dealer.new
    @deck = Cards.new
    @bank = 20
  end

  def start
    loop do
      show_menu
      choice = input_choice
      action(choice)
      break if @choice.zero?
    end
  end

  def show_menu
     puts %(
    1 Введите свое имя:
    2 сделать ставку, начать раздачу карт
    3
    )
  end

  def input_choice
    puts 'Введите номер операции'
    @choice = $stdin.gets.chomp.to_i
  end

  def action(_choice)
    case @choice
    when 1
      name_input
    when 2
      start_game
    when 3
    end
  end

  def name_input
    puts 'Введите свое имя, не оставляйте незаполненным'
    inp = $stdin.gets.chomp
    @gamer = Gamer.new(inp)
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
    puts "Карты дилера: * * "
    puts @gamer.bank
    next_menu
  end

  def next_menu


end
a=Main.new
a.start
