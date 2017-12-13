class GamePrompt
  def initialize
    @player = ''
  end

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

  def map_introduction
    puts "The 'P' is where you are on this map. Every room you encounter will leave an 'x' behind you, every 'O' is a room that is a mystery to you."
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

  def txt_br
    "     = = = = = = = = = = = = = "
  end

end
