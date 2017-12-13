require './src/PlayerClass.rb'
require './src/GamePrompt.rb'
require './src/Map.rb'

class GameState

  attr_reader :player, :map, :nemesis

  def initialize()
    @prompts = GamePrompt.new
    begin_prompts(@prompts)

    @player = Player.new(@user_login, @username, @weapon, @armor)
    @map = Map.new
    @turn = true
    @nemesis = ['Wood Witch' , 'Elder Flower', 'Vine Viper'].sample

    #start gameplay
    play_game(@prompts)
  end

  def begin_prompts(prompts)
    @user_login = prompts.get_player_name
    @username = prompts.get_witch_name
    @weapon = prompts.get_weapon
    @armor = prompts.get_armor
  end

  def switch_turn
    @turn = !@turn 
  end

  def valid_game?
    @player.is_alive? #&& @nemesis.is_alive?
  end

  def play_game(game_prompts)

    while player.is_alive?
      @game_prompts = game_prompts
      @game_prompts.welcome_message(@player)
      @game_prompts.map_introduction()
      @map.print_map()
      @player.takes_damage(50)

      if !player.is_alive?
        @game_prompts.game_over
      end
    end
  end
end

# Begin Game
game = GameState.new


