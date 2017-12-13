require './src/PlayerClass.rb'
require './src/GamePrompt.rb'
require './src/Map.rb'

class GameState

  attr_reader :player, :map, :nemesis

  def initialize(user, name, weapon, armor)
    @player = Player.new(user, name, weapon, armor) # weapon, armor
    @turn = true
    @nemesis = ['Wood Witch' , 'Elder Flower', 'Vine Viper'].sample
    @map = Map.new
  end

  def switch_turn
    @turn = !@turn 
  end

  def valid_game?
    @player.is_alive? #&& @nemesis.is_alive?
  end

  def play_game(game_prompts)
    @game_prompts = game_prompts
    @game_prompts.welcome_message(@player)
    @game_prompts.map_introduction()
    puts @map.show_pretty_map
  end
end


# Start Screen: get player data

reaction = GamePrompt.new

user_login = reaction.get_player_name
user_name = reaction.get_witch_name
weapon = reaction.get_weapon
armor = reaction.get_armor


# Begin Game
game = GameState.new(user_login, user_name, weapon, armor)
game.play_game(reaction)


