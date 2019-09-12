require_relative "../piece"
require_relative "module_slideable"

class Bishop < Piece

  def symbol
    :B
  end

  protected

  def move_dirs
    [
      [1,1],
      [1,-1],
      [-1,-1],
      [-1,1]
    ]
  end
end