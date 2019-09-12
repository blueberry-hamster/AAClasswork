require "byebug"
# getting pieces
require_relative "./pieces/nullpiece"
require_relative "./pieces/rook"
require_relative "./pieces/knight"
require_relative "./pieces/king"
require_relative "./pieces/queen"
require_relative "./pieces/pawn"
require_relative "./pieces/bishop"

class Board 
  attr_accessor :piece, :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } } 
    # @piece = Piece.new

    initiate_board
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    # debugger
    if self[start_pos].is_a? NullPiece 
      raise InvalidStartPos
    end

    end_row, end_col = end_pos
    unless end_row.between?(0, 7) && end_col.between?(0, 7)
      raise InvalidEndPos
    end

    self[end_pos] = @piece
    self[start_pos] = NullPiece.instance
  end

  def initiate_board 
   self[[0, 0]] = Rook.new(:white, self, [0, 0])
   self[[0, 7]] = Rook.new(:white, self, [0, 7])
   self[[7, 0]] = Rook.new(:black, self, [7, 0])
   self[[7, 7]] = Rook.new(:black, self, [7, 7])

   self[[0, 1]] = Knight.new(:white, self, [0, 1])
   self[[0, 6]] = Knight.new(:white, self, [0, 6])
   self[[7, 1]] = Knight.new(:black, self, [7, 1])
   self[[7, 6]] = Knight.new(:black, self, [7, 6])

   self[[0, 2]] = Bishop.new(:white, self, [0, 2])
   self[[0, 5]] = Bishop.new(:white, self, [0, 5])
   self[[7, 2]] = Bishop.new(:black, self, [7, 2])
   self[[7, 5]] = Bishop.new(:black, self, [7, 5])

   self[[0, 3]] = King.new(:white, self, [0, 3])
   self[[7, 3]] = King.new(:black, self, [7, 3])

   self[[0, 4]] = Queen.new(:white, self, [0, 4])
   self[[7, 4]] = Queen.new(:black, self, [7, 4])
  
   self[[1, 0]] = Pawn.new(:white, self, [1, 0])
   self[[1, 1]] = Pawn.new(:white, self, [1, 1])
   self[[1, 2]] = Pawn.new(:white, self, [1, 2])
   self[[1, 3]] = Pawn.new(:white, self, [1, 3])
   self[[1, 4]] = Pawn.new(:white, self, [1, 4])
   self[[1, 5]] = Pawn.new(:white, self, [1, 5])
   self[[1, 6]] = Pawn.new(:white, self, [1, 6])
   self[[1, 7]] = Pawn.new(:white, self, [1, 7])

   self[[6, 0]] = Pawn.new(:black, self, [6, 0])
   self[[6, 1]] = Pawn.new(:black, self, [6, 1])
   self[[6, 2]] = Pawn.new(:black, self, [6, 2])
   self[[6, 3]] = Pawn.new(:black, self, [6, 3])
   self[[6, 4]] = Pawn.new(:black, self, [6, 4])
   self[[6, 5]] = Pawn.new(:black, self, [6, 5])
   self[[6, 6]] = Pawn.new(:black, self, [6, 6])
   self[[6, 7]] = Pawn.new(:black, self, [6, 7])
  end
  
end

class InvalidStartPos < StandardError
  def initialize(msg="No piece at start pos")
    super
  end  
end

class InvalidEndPos < StandardError
  def initialize(msg="You can't move to end pos")
    super
  end  
end