require_relative "board"


class Piece

  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    case symbol
    when :N
      "   "
    when :B
      " B "  
    when :R 
      " R "
    when :Kn
      " Kn"
    when :p 
      " p "
    when :K 
      " K "
    when :Q
      " Q "
    end
  end

  def empty?

  end

  def valid_moves

  end

  def symbol

  end

  private

  def move_into_check?(end_pos)

  end
  
end