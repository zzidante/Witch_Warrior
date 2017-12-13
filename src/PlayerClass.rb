class Player
  attr_reader :health, :type
  attr_accessor :user, :name, :weapon, :armor

  def initialize(user, name, weapon, armor)
    @user = user
    @name = name
    @weapon = weapon
    @armor = armor
    @health = 100
    @type = ['Glass', 'Parchment', 'Stone'].sample
  end

  def is_alive?
    @health > 0
  end

  def is_dead?
    @health <= 0 ? true : false
  end

  def takes_damage(dmg = 1, type = nil)
    @health -= dmg
  end
end
