class GamePrompt
  
  def map_introduction(map, player)
    puts "The 'P' is where you are on this map.\nEvery room you encounter will leave an 'x' behind you. Every 'O' is a room that is a mystery to you.",
    map.show_pretty_map,
    "Your valid direction choices will appear below the map. \nUse \"North\", \"South\", \"East\" and \"West\" to move around the map.",
    "Try it now, these are your choices... #{map.name_valid_directions(player)}"
  end
  
  def welcome_message(player)
    puts "\nWelcome #{player.user}, you are playing as #{player.name}. You hold a #{player.weapon} tightly in your grasp",
    "and #{player.armor} protectively across your person.",
    "#{self.txt_br}",        
    "You are a #{player.type} Witch and have #{player.health} health.",
    "#{self.txt_br}"        
  end

  def player_cycle(player)
    puts "---> #{player.name} turn."
    puts "#{player.health}/#{player.max_health}"
  end

  def restart?
    puts "Play again? -- YES / NO"
  end

  def game_over(player)
    puts "\nGAME OVER #{player.name}.\nYou have reached #{player.health} health.\nBetter luck next time"
  end

  def win_game
    puts "You did it! You killed your nemesis! Great job. You win!"
  end

  def txt_br
    "     = = = = = = = = = = = = = \n\n"
  end

end
