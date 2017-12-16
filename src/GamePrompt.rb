class GamePrompt
  def initialize
    @player = ''
  end

  private

  def get_player_name
    puts "Who is playing WITCH WARRIOR today?"
    gets.chomp!
  end

  def get_witch_name
    puts "What is ye name witch?"
    gets.chomp!    
  end

  def get_weapon
    puts "What is your weapon?"
    gets.chomp!    
  end

  def get_armor
    puts "What armor do you wear?"
    gets.chomp!      
  end

  public

  def get_player_info
    user_login = get_player_name()
    username = get_witch_name()
    weapon = get_weapon()
    armor = get_armor()
    return player_info = [user_login, username, weapon, armor]
  end

  def map_introduction(map)
    puts "The 'P' is where you are on this map.\nEvery room you encounter will leave an 'x' behind you. Every 'O' is a room that is a mystery to you.",
    map.show_pretty_map,
    "Your valid direction choices will appear below the map. \nUse \"North\", \"South\", \"East\" and \"West\" to move around the map.",
    "Try it now, these are your choices... #{map.name_valid_directions(@player)}"
  end
  
  def welcome_message(player)
    @player = player
    puts "\nWelcome #{@player.user}, you are playing as #{@player.name}. You hold a #{@player.weapon} tightly in your grasp",
    "and #{@player.armor} protectively across your person.",
    "#{self.txt_br}",        
    "You are a #{@player.type} Witch and have #{@player.health} health.",
    "#{self.txt_br}"        
  end

  def game_over
    puts "\nGAME OVER #{@player.name}.\nYou have reached #{@player.health} health.\nBetter luck next time"
  end

  def win_game
    puts "You did it! You killed your nemesis! Great job. You win!"
  end

  def txt_br
    "     = = = = = = = = = = = = = \n\n"
  end

end
