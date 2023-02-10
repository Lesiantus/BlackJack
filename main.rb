require_relative 'user'
require_relative 'admin'
require_relative 'gamer'
require_relative 'valid'
require_relative 'cards'


class Main
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
    2 начать раздачу карт
    3
    4
    5
    6
    )
  end

  def action(_choice)
    case @choice
    when 1
      enter_name
    when 2
      start_game
    when 3
    end
  end

