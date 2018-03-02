module Combatable
  BASE_STATS = {
    max_hit_points: 10,
    attack_power:   12
  }

  def Combatable.included(mod)
    attr_accessor :hit_points, :attack_power
  end

  def initialize_stats(stats)
    @stats = stats

    @hit_points   = stats[:max_hit_points]
    @attack_power = stats[:attack_power]
  end

  def alive?
    @hit_points > 0
  end

  def takes_damage(dmg = 1, type = nil)
    if type
      @health -= dmg * type
    else 
      @health -= dmg
    end
  end

  def heal(amount)
    @hit_points += amount
    @hit_points = [@hit_points, @stats[:max_hit_points]].min
  end

  def print_health
    puts "Your current health: #{@health}"
  end
end
