class Gamer < User
  NAME_FORMAT = /^[a-zа-я0-9]{1,20} ?[a-zа-я0-9]{1,20}$/i
  def initialize(name)
    super
    validate!
  end

