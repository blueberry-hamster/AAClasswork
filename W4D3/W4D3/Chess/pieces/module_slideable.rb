module Slideable
  #@pos
  #@color
  #@board

  def moves
    valid_moves = []
    row, col = pos

    move_dirs.each do |curr_pos|

      while on_board?(curr_pos) && take_piece?(curr_pos)
        valid_moves << curr_pos

        curr_row, curr_col = curr_pos
        curr_pos = [row + curr_row, col + curr_col]
      end
    end
    
    valid_moves
  end
  
  def take_piece?(pos)
    maybe_piece = board[pos]
    return true if maybe_piece.is_a? NullPiece 

    color_at_pos = maybe_piece.color
    self.color != color_at_pos
  end

  def on_board?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  private 
  
  def move_dirs #fix_me

    
  end
end