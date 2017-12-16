require_relative './Room.rb'

class Map

  # include Descriptors
  attr_reader :map, :show_pretty_map

  def initialize(player)
    @player = player
    @player_icon = "[ P ]"
    @empty_icon =  "[ O ]"
    @visited_icon = "[ x ]"
    @map_size =    3
    @map =         []
    @show_pretty_map =  ""
    @make_map =    make_map(@player)
  end

  private 

  def make_map(player)
    @map_size.times do
      @map.push(Array.new(@map_size, @empty_icon))
    end
    position_player(player)
  end

  def make_pretty_map(map)
    @show_pretty_map = ""
    map.each do |row|
      @show_pretty_map+= row.each { |x| x }.join("  ")
      @show_pretty_map+= "\n"
    end
    return @show_pretty_map
  end

  def position_player(player)
    @map[player.y][player.x] = @player_icon
    make_pretty_map(@map)
  end

  def reset_player_position(player)
    @map[player.y][player.x] = @visited_icon
  end

  def valid_move?(player, axis, step)
    if axis == "x"
      if player.x + step < 0 || player.x + step > @map_size - 1
        invalid_move_message()
        return false
      else
        reset_player_position(player)        
        return true
      end
    end
    if axis == "y"
      if player.y + step < 0 || player.y + step > @map_size - 1
        invalid_move_message()
        return false
      else
        reset_player_position(player)
        return true
      end
    end
  end

  def invalid_move_message()
    return "There is a wall there \n" + @show_pretty_map
  end

  public

  def print_map
    puts @show_pretty_map
  end

  def name_valid_directions(player)
    valid_direction = []
    if player.y == 0 
      valid_direction.push("South")
    elsif player.y == @map_size - 1
      valid_direction.push("North")
    else
      valid_direction.push("North", "South")
    end
    if player.x == 0
      valid_direction.push("East")
    elsif player.x == @map_size - 1
      valid_direction.push("West")
    else 
      valid_direction.push("East", "West")
    end
    return valid_direction.join(", ")
  end

  def move_player(player, direction)
    case direction
    when "left", "west"
      valid_move?(player, "x", -1) ? player.x -= 1 : (return invalid_move_message())

    when "right", "east"
      valid_move?(player, "x", 1) ? player.x += 1 : (return invalid_move_message()) 

    when "north", "up", "top"
      valid_move?(player, "y", -1) ? player.y -= 1 : (return invalid_move_message())

    when "south", "down", "bottom"
      valid_move?(player, "y", 1) ? player.y += 1 : (return invalid_move_message())
    end
    position_player(player)
  end

  def test_simple_move(player, direction)
    return move_player(player, direction), name_valid_directions(player).join(", ") + "\n"
  end

  def test_complex_move(player, arr_directions)
    map_collection = ""
    arr_directions.each do |dir|
      map_collection += dir.upcase() + ": " + "\n"
      map_collection += move_player(player, dir)
      map_collection += name_valid_directions(player) + "\n" + "\n"
    end
    return map_collection + "\n"
  end

end

# For Testing

# map = Map.new
# puts "You are here" + "\n" + map.show_pretty_map + "\n"
# puts map.test_complex_move(["south", "east", "north", "east", "south", "south", "south", "west"])
# puts map.test_simple_move("south")

