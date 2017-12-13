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

end
