require_relative './Room.rb'

class Map

  # include Descriptors
  attr_reader :map, :show_pretty_map

  def initialize(player)
    @player =       player
    @player_icon =  "[ P ]"
    @empty_icon =   "[ O ]"
    @visited_icon = "[ x ]"
    @map_size =     3
    @map =          []
    @show_pretty_map =  ""
    @make_map =     make_map(@player)
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
    puts @show_pretty_map
  end

  def position_player(player)
    @map[player.y][player.x] = @player_icon
    return make_pretty_map(@map)
  end

  def reset_player_position(player)
    @map[player.y][player.x] = @visited_icon
  end

  def valid_move?(player, axis, step)
    if axis == "x"
      puts "valid: x"
      if player.x + step < 0 || player.x + step > @map_size - 1
        puts "validX: invalid"
        invalid_move_message()
        return false
      else
        puts "validX: true"
        reset_player_position(player)        
        return true
      end
    end
    if axis == "y"
      puts "valid: y"      
      if player.y + step < 0 || player.y + step > @map_size - 1
        puts "validY: invalid"        
        invalid_move_message()
        return false
      else
        puts "validY: true"        
        reset_player_position(player)
        return true
      end
    end
  end

  def invalid_move_message()
    puts "There is a wall there \n"
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
    direction = direction.downcase
    case direction
    when "left", "west"
      valid_move?(player, "x", -1) ? player.x -= 1 : invalid_move_message()
      position_player(player)
    when "right", "east"
      valid_move?(player, "x", 1) ? player.x += 1 : invalid_move_message()
      position_player(player)
    when "north", "up", "top"
      valid_move?(player, "y", -1) ? player.y -= 1 : invalid_move_message()
      position_player(player)
    when "south", "down", "bottom"
      valid_move?(player, "y", 1) ? player.y += 1 : invalid_move_message()
      position_player(player)
    else 
      return false
    end
  end
end