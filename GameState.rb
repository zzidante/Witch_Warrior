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

  def player_turn_cycle(opponent)
    puts "Player's turn"
    @player.print_health
    @turn = false
    if @battle
      opponent.takes_damage(5)
    end
  end

  def opponent_turn_cycle(opponent)
    # if opponent == "monster"
      puts "Opponent goes."
      opponent.print_health  
      @player.takes_damage(20)      
    # else
    #   puts "Nemesis goes"      
    #   @player.takes_damage(20)      
    # end
    @turn = true
  end

  def opponent_encounter?
    if rand(3) === 2
      puts "AHHH! A monster!"
      @battle = true
    end
  end 

  def battle_sequence(opponent)
    @monster = Monster.new
    while @player.is_alive? && @monster.is_alive?
      @turn ? player_turn_cycle(@monster) : opponent_turn_cycle(@monster)            
    end
    end_game_sequence(@monster)
  end 

  def end_game_sequence(opponent)
    if !@player.is_alive?
      @battle = false          
      @prompts.game_over
    end

    if !opponent.is_alive?
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

      # Stage 3A - Encounter
      if opponent_encounter?
        # Stage 4A - Battle Sequence
        if @battle # should be while battle
          puts "Let's battle!"
          battle_sequence("monster")
        end
      end
      # Stage 5A - Item Pickup
    end
  end
end

# Begin Game
game = GameState.new
