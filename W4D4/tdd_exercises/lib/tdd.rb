def my_uniq(arr)
  new_arr = []
  arr.each do |el|
    unless new_arr.include?(el)
      new_arr << el 
    end
  end
  new_arr
end

class Array

  def two_sum
    pairs = []

    (0...self.length).each do |i|
      ((i+1)...self.length).each do |j|
        if self[i] + self[j] == 0
          pairs << [i, j]
        end
      end
    end

    return pairs 
  end
  
end

def my_transpose(matrix)
  len = matrix.length
  transposed_arr = Array.new(len) { Array.new(len) }
  (0...len).each do |row|
    (0...len).each do |col|
      transposed_arr[col][row] = matrix[row][col]
    end
  end
  transposed_arr
end

def stock_price(arr)
  return nil if arr.empty?
  all_pairs = in_order_pairs(arr)
  profitable = all_pairs.select { |pair| pair.first < pair.last }
  best_prices = profitable.max_by { |pair| pair.last - pair.first }
  [arr.index(best_prices.first), arr.index(best_prices.last)]
end

def in_order_pairs(arr)
  pairs = []
  len = arr.length
  (0...len).each do |i|
    (i...len).each do |j|
      pairs << [arr[i], arr[j]]
    end
  end
  pairs
end