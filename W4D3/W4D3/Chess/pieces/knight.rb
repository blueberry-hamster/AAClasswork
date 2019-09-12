require_relative "../piece"
require_relative "module_stepable"

class Knight < Piece

  def symbol
    :Kn
  end

  protected

  def move_diffs
    [
    [2,1],
    [-2,-1],
    [1,2],
    [-1,-2],
    [-1,2],
    [1,-2],
    [-2,1],
    [2,-1]
  ]
  end
end