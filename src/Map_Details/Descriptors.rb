class Descriptors
  def initialize
    @random_key = rand(1..100)
    @room = room_decor()
  end

  def room_decor
    room_decor = [
      "moss", "wood", "stone", "a glistening blue softness",
      "algae", "dark wood", "soot covered brick", "mud",
      "pebble-masonry", "fire-seared copper plate", 
      "lead", "utter darkness", "vines", "animals pelts",
      "steel", "old barrel panels", "chain", "slime",
    ]
    return room_decor.sample
  end

  def room_smell
    room_smell = [
      'grass', 'brimstone', 'an ocean breeze', 'iron',
      'men\'s cologne', 'wet stone', 'stale mould', 
      'sharp like snow', 'fresh roasted meat', 'apples'
    ]
    return room_smell.sample
  end
end