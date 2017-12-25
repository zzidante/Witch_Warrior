require './src/Player.rb'
require './src/GamePrompt.rb'
require './src/Map.rb'
require './src/Monster.rb'


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
    puts "Player's turn"
    @player.print_health
    @turn = false
  end

  def opponent_turn_cycle(opponent)
    if opponent == "monster"
      puts "Opponent goes."      
      @player.takes_damage(20)      
    else
      puts "Nemesis goes"      
      @player.takes_damage(20)      
    end
    @turn = true
  end

  def opponent_encounter?
    if rand(3) === 2
      puts "AHHH! A monster!"
      monster = Monster.new
      @battle = true
    end
  end 

  def battle_sequence(opponent)
    while @player.is_alive? && @player.nemesis_alive?
      @turn ? player_turn_cycle : opponent_turn_cycle(opponent)            
    end
    end_game_sequence
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
      puts @player.move_room(@map, gets.chomp!)

      # Stage 2C - Encounter
      opponent_encounter?

      # Stage 2B - Battle Sequence
      if @battle
        puts "Let's battle!"
        battle_sequence("monster")
      end
    end
  end
end

# Begin Game
game = GameState.new
