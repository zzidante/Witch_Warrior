require './src/Player.rb'
require './src/GamePrompt.rb'
require './src/Map.rb'

class GameState
  @@PLAY_SESSIONS = []

  attr_reader :player, :map

  def initialize()
    @@PLAY_SESSIONS << self
    @prompts = GamePrompt.new
    @player = Player.new(@prompts.get_player_info)
    @map = Map.new(@player)
    @tutorial = true
    @turn = true
    @battle = false
    #start gameplay
    play_game()
  end

  # Class Function to get sessions
  def self.get_sessions
    return @@PLAY_SESSIONS
  end

  def switch_turn
    @turn = !@turn 
  end

  def play_intro
    @prompts.welcome_message(@player)
    @prompts.map_introduction(@map)
    @tutorial = false    
  end

  def player_turn_cycle
    @player.print_health
    @player.takes_damage(20)
    @turn = false
  end

  def opponent_turn_cycle(opponent)
    if opponent == "monster"
      puts "Opponent goes."
    else
      puts "Nemesis goes"
    end
    @turn = true
  end

  def opponent_encounter?
    monster_chance = rand(11)
    puts monster_chance
    if monster_chance === 10
      @battle = true
    end
  end 

  def battle_sequence(opponent)
    if @battle
      @turn ? player_turn_cycle : opponent_turn_cycle(opponent)
      end_game_sequence                
    end
  end 

  def end_game_sequence
    if !@player.is_alive?
      @battle = false          
      @prompts.game_over
    end

    if @player.nemesis_dead?(false)
      @battle = false                    
      @prompts.win_game
    end
  end

  def play_game()
    while @player.is_alive?

      # Stage 1 - Introduction (if tutorial is true, play intro)
      @tutorial && play_intro

      # Stage 2A - Movement (player moves rooms according to player input of direction)
      @player.move_room(@map, gets.chomp!)

      # Stage 2C - Encounter
      opponent_encounter?

      # Stage 2B - Battle Sequence
      battle_sequence("monster")
    end
  end
end

# Begin Game
game = GameState.new


