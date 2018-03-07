require_relative './InputOverrideCommands.rb'

class GatherUserInput
  def initialize
    @validate_input = GetsChomp::InputOverrideCommands::TransformInput
  end

  # private - # Going to have to return player info to gameState to save

  def get_player_name
    puts "Who is playing WITCH WARRIOR today?"
    @validate_input.get_input
  end

  def get_witch_name
    puts "What is ye name witch?"
    @validate_input.get_input
  end

  def get_weapon
    puts "What is your weapon?"
    @validate_input.get_input
  end

  def get_armor
    puts "What armor do you wear?"
    @validate_input.get_input
  end

  public

  def get_player_info
    user_login = get_player_name()
    username = get_witch_name()
    weapon = get_weapon()
    armor = get_armor()
    return player_info = [user_login, username, weapon, armor]
  end
end
