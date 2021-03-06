class Player
  attr_reader :health, :type, :attack_power, :max_health
  attr_accessor :user, :name, :weapon, :armor, :x, :y

  def initialize(collection)
    @user = collection[0]
    @name = collection[1]
    @weapon = collection[2]
    @armor = collection[3]
    @max_health = 100
    @health = 100
    @inventory = []
    @attack_power = 1
    @type = ['Glass', 'Parchment', 'Stone'].sample
    @x = 0
    @y = 0
  end

  def nemesis_alive?(answer = true)
    answer
  end

  def is_alive?
    @health > 0
  end

  def takes_damage(dmg = 1, type = nil)
    if type
      @health -= dmg * type
    else 
      @health -= dmg
    end
  end

  def print_health
    puts "Your current health: #{@health}"
  end

  def move_room(map, direction)
    map.move_player(self, direction)
  end
end
