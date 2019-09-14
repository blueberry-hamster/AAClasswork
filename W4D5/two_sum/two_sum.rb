require "set"

#n^2
def bad_two_sum?(arr, target_sum)
  pair_idx = []

  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      pair_idx << [arr[i], arr[j]] if i != j 
    end
  end

  pair_idx.any? { |pair| pair.sum == target_sum }
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


#nlog(n)
def okay_two_sum?(arr, target_sum)
  arr.sort!
  arr.each_with_index do |num, i|
    diff = target_sum - num
    left = arr[0...i].bsearch { |el| el == diff }
    right = arr[i + 1..-1].bsearch { |el| el == diff }
    return true if left || right
  end
  false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false


#n
# def two_sum?(arr, target_sum)
#   set = arr.to_set

#   arr.each do |num|
#     diff = target_sum - num 
#     set.delete(num)
#     return true if set.include?(diff)
#   end

#   false
# end

def two_sum?(arr, target_sum)
  set = Set.new
  arr.each do |num|
    diff = target_sum - num
    return true if set.include?(diff)

    set << num
  end
  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false