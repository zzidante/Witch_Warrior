require './Descriptors'

class Room
  def initialize 
    @description = build_description()
    @content = build_contents
    @exit = room_has_exit?()
  end

  def room_has_exit?(bool = false)
    return false
  end

  def enter_room
    return @description
  end

  def exit_level?
    @exit ? true : false
  end

  def stuff_inside_room
    case @content
    when "monster"
      return "monster"
    when "item"
      return "item"
    when "nothing"
      return "nothing"
    end
  end

  def build_description
    descriptors = Descriptors.new
    return "Inside it looked as though it was made of " + descriptors.room_decor + " and it smelt of " + descriptors.room_smell + "."
  end

  def build_contents
    return ["monster", "item", "nothing"].sample
  end
end

room = Room.new

puts room.enter_room
puts room.room_has_exit?
puts room.exit_level?
puts room.stuff_inside_room