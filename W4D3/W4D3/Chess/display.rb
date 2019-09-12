require_relative "board"
require "byebug"
# require_relative "cursor"

class Display
  attr_reader :board

  def initialize(board)
    @board = board
    # @cursor = Cursor.new
  end

  def render
    puts "    0  1  2  3  4  5  6  7 "
    # debugger
    board.grid.each_with_index do |row, idx|
      puts " #{idx} " + row.map{ |piece| piece.to_s }.join("")
    end
    # debugger
  end
  
end