require_relative "../piece"

class Pawn < Piece
  #@pos
  #@color
  #@board

  def symbol
    :p
  end

  def move_dirs
    forward_steps = forward_steps.select { |piece| on_board?(piece) && empty_piece?(piece)}

    side_attacks + forward_steps 
  end
  
  private

  def at_start_row?
    row, _col = pos 

    at_white_start = (color == :white && row == 1)
    at_black_start = (color == :black && row == 6)

    return true if at_white_start || at_black_start

    false
  end

  def forward_dir
    #returns 1 or -1
    if color == :black
      -1
    else
      1
    end

  end

  def forward_steps
    row, col = pos

    if forward_dir == 1
      at_start_row? ? [row + 2, col] : [row + 1, col]
    else
      at_start_row? ? [row - 2, col] : [row - 1, col]
    end 

  end

  def side_attacks
    row, col = pos

    if forward_dir == 1
      left_pos = [row - 1, col + 1]
      right_pos = [row + 1, col + 1]

    else 
      left_pos = [row - 1, col - 1]
      right_pos = [row + 1, col - 1]

    end

    [left_pos, right_pos].select { |piece| on_board?(piece) && eat_piece?(piece)}
  end

  def on_board?(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end

  def take_piece?(pos)
    maybe_piece = board[pos]
    return true if maybe_piece.is_a? NullPiece 
    false
  end

  def eat_piece?(pos)
    color_at_pos = maybe_piece.color
    self.color != color_at_pos
  end
end