module Descriptors

  def Descriptors.Room_description
    "You look around and the walls are made of #{room_walls} and smells of #{room_smell}"
  end

  private

  def Descriptors.room_walls
    return [
      "moss", "wood", "stone", "a glistening blue softness",
      "algae", "dark wood", "soot covered brick", "mud",
      "pebble-masonry", "fire-seared copper plate", 
      "lead", "utter darkness", "vines", "animals pelts",
      "steel", "old barrel panels", "chain", "slime",
    ].sample
  end

  def Descriptors.room_smell
    return [
      'grass', 'brimstone', 'an ocean breeze', 'iron',
      'men\'s cologne', 'wet stone', 'stale mould', 
      'sharp like snow', 'fresh roasted meat', 'apples'
    ].sample
  end
end