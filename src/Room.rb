require_relative './Descriptors.rb'

class Room

  include Descriptors

  attr_reader :description, :content, :exit

  def initialize
    @description = Descriptors::Room_description()
    @content = build_contents
    @exit = room_has_exit?
  end

  def room_has_exit?(bool = false)
    return false
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

  def build_contents
    return ["monster", "item", "nothing"].sample
  end
end

# For testing

# room = Room.new
# puts room.description
# puts room.room_has_exit?
# puts room.exit_level?
# puts room.stuff_inside_room