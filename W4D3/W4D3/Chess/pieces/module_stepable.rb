module Stepable
  #@pos
  #@color
  #@board
  
  def moves 
    p_row, p_col = pos
    
    move_diffs.map do |m_pos|
      m_row, m_col = m_pos
      [p_row + m_row, p_col + m_col]
    end
  end
  
  def filter_moves(moves)
    moves.select do |pos|
      on_board?(pos) && take_piece?(pos)
    end
  end

  def take_piece?(pos)
    # can I take nullpiece?
    maybe_piece = board[pos]
    return true if maybe_piece.is_a? NullPiece 
    
    # can I take this piece?
    color_at_pos = maybe_piece.color
    self.color != color_at_pos
  end

  def on_board?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  private 
  
  def move_diffs #fix_me
    #   MOVES = [
    #   [2,1],
    #   [-2,-1],
    #   [1,2],
    #   [-1,-2],
    #   [-1,2],
    #   [1,-2],
    #   [-2,1],
    #   [2,-1]
    # ]
    
  end
end

