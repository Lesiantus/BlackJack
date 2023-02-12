require_relative 'user'
class Gamer < User
  NAME_FORMAT = /^[a-zа-я0-9]{1,20} ?[a-zа-я0-9]{1,20}$/i.freeze
  def initialize(name)
    super
    validate!
  end

  protected

  def validate!
    raise 'неподдерживаемый формат имени введите другое' if name !~ NAME_FORMAT

    true
  end
end
