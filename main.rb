require_relative 'user'
require_relative 'admin'
require_relative 'gamer'
require_relative 'cards'
require_relative 'card'

class Main
  def initialize
    @deck = Cards.new
    @dealer = Dealer.new
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
    puts @gamer.bank.to_s
    puts @dealer.bank.to_s
    puts "Ваши карты: #{@gamer.string_view}"
    if @gamer.total == 21 || @dealer.total == 21
      puts 'Блэк Джэк!'
      count
    else
      puts "#{@gamer.total} ваша сумма баллов"
      next_menu
    end
    puts 'Карты дилера: * * '
    puts @gamer.bank
  end

  def again
    puts %(
    Еще партию?:
    1 Да
    2 Нет, закончить игру
    )
    loop do
      input = $stdin.gets.chomp.to_i
      case input
      when 1
        @gamer.cards.clear
        @dealer.cards.clear
        start_game
        break
      when 2
        break
      else 'Введите 1 или 2'
      end
    end
  end

  def count
    gamer_points = @gamer.total
    dealer_points = @dealer.total
    if gamer_points == dealer_points
      puts "Ровно, ваши карты: #{@gamer.string_view}  карты дилера: #{@dealer.string_view}"
      @gamer.win(@bank / 2)
      @dealer.win(@bank / 2)
    elsif gamer_points == 21
      @gamer.win(@bank)
      puts "Победа! ваши карты: #{@gamer.string_view}  карты дилера: #{@dealer.string_view}"
    elsif dealer_points == 21
      @dealer.win(@bank)
      puts "Проигрыш, ваши карты: #{@gamer.string_view}, карты дилера: #{@dealer.string_view} очки: #{dealer_points}"
    elsif gamer_points < 21 && dealer_points < 21
      if gamer_points > dealer_points
        puts "Победа! ваши карты: #{@gamer.string_view}, карты дилера: #{@dealer.string_view}очки: #{dealer_points}"
        @gamer.win(@bank)
      elsif gamer_points < dealer_points
        puts "Проигрыш, ваши карты: #{@gamer.string_view}, карты дилера: #{@dealer.string_view},очки: #{dealer_points}"
        @dealer.win(@bank)
      end
    elsif gamer_points > 21
      puts "Проигрыш, ваши карты: #{@gamer.string_view}, перебор. карты дилера: #{@dealer.string_view},очки: #{dealer_points}"
      @dealer.win(@bank)
    elsif dealer_points > 21
      puts "Победа! ваши карты: #{@gamer.string_view}, карты дилера: #{@dealer.string_view} очки: #{dealer_points}"
      @gamer.win(@bank)
    end
    again
  end

  def dealer_turn
    return unless @dealer.total < 17

    @dealer.cards << @deck.take_card
  end

  def next_menu
    puts %(
    Ваш ход:
    1 пропустить
    2 Взять еще карту
    3 Открыть карты
    )
    loop do
      input = $stdin.gets.chomp.to_i
      case input
      when 1
        dealer_turn
        break
      when 2
        @gamer.cards << @deck.take_card
        dealer_turn
        break
      when 3
        dealer_turn
        break
      else
        puts ' Можно вводить только цифры от 1 до 3-ки'
      end
    end
    count
  end
end
a = Main.new
a.start
