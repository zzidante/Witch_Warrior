
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
  
  def welcome_message(player)
    @player = player
    puts "\nWelcome #{@player.user}, you are playing as #{@player.name}. You hold a #{@player.weapon} tightly in your grasp",
    "and #{@player.armor} protectively across your person.",
    "#{self.txt_br}",        
    "You are a #{@player.type} Witch and have #{@player.health} health.",
    "#{self.txt_br}"        
  end

  def txt_br
    "     = = = = = = = = = = = = = "
  end

end
