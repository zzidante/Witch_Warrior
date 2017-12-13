class Map

  attr_reader :map, :show_pretty_map

  def initialize()
    @player_icon = "[ P ]"
    @empty_icon =  "[ O ]"
    @visited_icon = "[ x ]"
    @map_size =    3
    @map =         []
    @show_pretty_map =  ""
    @make_map =    make_map()
    @x =           0
    @y =           0
  end

  private 

  def make_map
    @map_size.times do
      @map.push(Array.new(@map_size, @empty_icon))
    end
    position_player()
  end

  def pretty_map(map)
    @show_pretty_map = ""
    map.each do |row|
      @show_pretty_map+= row.each { |x| x }.join("  ")
      @show_pretty_map+= "\n"
    end
    return @show_pretty_map
  end

  def position_player(x = 0, y = 0)
    @map[y][x] = @player_icon
    pretty_map(@map)
  end

  def reset_player_position(x, y)
    @map[y][x] = @visited_icon
  end

  def valid_move?(axis, step)
    if axis == "x"
      if @x + step < 0 || @x + step > @map_size - 1
        invalid_move_message()
        return false
      else
        reset_player_position(@x, @y)        
        return true
      end
    end
    if axis == "y"
      if @y + step < 0 || @y + step > @map_size - 1
        invalid_move_message()
        return false
      else
        reset_player_position(@x, @y)
        return true
      end
    end
  end

  def invalid_move_message()
    return "There is a wall there \n" + @show_pretty_map
  end

  public
  
    def valid_directions
      valid_direction = []
      if @y == 0 
        valid_direction.push("South")
      elsif @y == @map_size - 1
        valid_direction.push("North")
      else
        valid_direction.push("North", "South")
      end
      if @x == 0
        valid_direction.push("East")
      elsif @x == @map_size - 1
        valid_direction.push("West")
      else 
        valid_direction.push("East", "West")
      end
      return valid_direction
    end
  
    def move_player(direction)
      case direction
      when "left", "west"
        valid_move?("x", -1) ? @x -= 1 : (return invalid_move_message())

      when "right", "east"
        valid_move?("x", 1) ? @x += 1 : (return invalid_move_message()) 

      when "north", "up", "top"
        valid_move?("y", -1) ? @y -= 1 : (return invalid_move_message())

      when "south", "down", "bottom"
        valid_move?("y", 1) ? @y += 1 : (return invalid_move_message())
      end
      position_player(@x, @y)
    end

    def test_simple_move(direction)
      return move_player(direction), valid_directions.join(", ") + "\n"
    end

    def test_complex_move(arr_directions)
      map_collection = ""
      arr_directions.each do |dir|
        map_collection += dir.upcase() + ": " + "\n"
        map_collection += move_player(dir)
        map_collection += valid_directions.join(", ") + "\n" + "\n"
      end
      return map_collection + "\n"
    end
end


# map = Map.new
# puts "You are here" + "\n" + map.show_pretty_map + "\n"
# puts map.test_complex_move(["south", "east", "north", "east", "south", "south", "south", "west"])

# puts map.test_simple_move("south")

