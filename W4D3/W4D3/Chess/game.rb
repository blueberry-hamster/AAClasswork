require_relative "board"
require_relative "player"
require_relative "display"

class Game
  def initialize
    @board = Board.new
    @display = Display.new
    @players = {player_1:Player.new(), player_2:Player.new()} #fix_me
    @current_player = :player_1
  end

  def play

  end

  private

  def notify_players

  end

  def swap_turn!

  end
  
end