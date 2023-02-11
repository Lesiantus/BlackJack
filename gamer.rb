require_relative 'user'
class Gamer < User
  NAME_FORMAT = /^[a-zа-я0-9]{1,20} ?[a-zа-я0-9]{1,20}$/i
  def initialize(name)
    super
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise 'Введите имя игрока, имя не может быть пустым' if name.nil?
    if name !~ NAME_FORMAT
      raise 'неподдерживаемый формат имени введите другое'
    end

    true
  end
end


