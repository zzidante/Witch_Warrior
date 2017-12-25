class Monster
  attr_reader :health, :type, :attack_power
  attr_accessor :user, :name, :weapon, :armor

  BASE_HIT_POINTS = 10

  def initialize()
    @health = BASE_HIT_POINTS
    @attack_power = 1
    @type = ['Ice', 'Fire', 'Green'].sample
  end

  def is_alive?
    @health > 0
  end

  def takes_damage(dmg = 1, type = nil)
    @health -= dmg
  end

  def print_health
    puts "Your current health: #{@health}"
  end

end
