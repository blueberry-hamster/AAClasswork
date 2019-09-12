require_relative "../piece"
require_relative "module_slideable"

class Rook < Piece

  def symbol
    :R
  end

  protected

  def move_dirs
    [
      [1,0],
      [0,-1],
      [-1,0],
      [0,1]
    ]
  end
end