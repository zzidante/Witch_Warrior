require './src/Player.rb'
require './src/GatherUserInput.rb' # need these things to return things to pass to Player
require './src/GamePrompt.rb'
require './src/Map.rb'
require './src/Monster.rb'

class GameState
  @@PLAY_SESSIONS = []

  attr_reader :player, :map

  def initialize()
    @@PLAY_SESSIONS << self

    # initialize elements
    @user_input = GatherUserInput.new
    @prompts = GamePrompt.new
    @player = Player.new(@user_input.get_player_info)
    @map = Map.new(@player)

    # set state flags
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
    @prompts.play_introduction(@map, @player)
    @tutorial = false
  end

  def player_turn_cycle(opponent)
    @prompts.player_cycle(@player)
    opponent.takes_damage(5)
    @turn = false
  end

  def opponent_turn_cycle(opponent)
    @prompts.opponent_cycle(opponent)
    @player.takes_damage(20) 
    @turn = true
  end

  def opponent_encounter?
    if rand(3) === 2
      puts "AHHH! A monster!"
      @battle = true
    end
  end 

  def battle_sequence
    @monster = Monster.new
    while @player.is_alive? && @monster.is_alive?
      @turn ? player_turn_cycle(@monster) : opponent_turn_cycle(@monster)            
    end
    @turn = true # reset player turn regardless of who's turn ended
    end_game_sequence(@monster)
  end 

  def play_again?
    @prompts.restart?
    answer = gets.chomp!.downcase

    case answer
    when 'yes', 'y'
      true
    when 'no', 'n'
      exit
    else
      play_again?
    end
  end

  def end_game_sequence(opponent)
    if !@player.is_alive?
      @battle = false          
      @prompts.game_over(@player)
    end

    if !opponent.is_alive?
      @battle = false                    
      @prompts.win_game
    end

    if play_again?
      game = GameState.new      
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
          battle_sequence
        end
      end
      # Stage 5A - Item Pickup
    end
    exit
  end
end

# Begin Game
game = GameState.new
