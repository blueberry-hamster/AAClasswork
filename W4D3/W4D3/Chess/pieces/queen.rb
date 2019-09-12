require_relative "../piece"
require_relative "module_slideable"

class Queen < Piece

  def symbol
    :Q
  end

  protected

  def move_dirs
    [
      [1,1],
      [1,0],
      [-1,-1],
      [0,-1],
      [1,-1],
      [-1,0],
      [-1,1],
      [0,1]
    ]
  end
end