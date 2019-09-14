# time complexity is n^2
def my_min(list)
  min = nil
  list.each do |num_1|
    list.each do |num_2|
      min = num_1 if num_1 < num_2 && ( min == nil || num_1 < min)
    end
  end
  min
end

# time complexity is n
def my_min(list)
  min = nil
  list.each do |num|
    min = num if min.nil? || num < min
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# time complexity is n^2
def largest_contiguous_subsum(arr)
  sums = []

  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      sums << arr[i..j].sum 
    end
  end

  sums.max 
end

# time complexity is n
def largest_contiguous_subsum(arr)
  
  temp = 0
  max = arr.first

  arr.each do |num|
    temp = temp + num
    if temp > 0
      max = temp if temp > max
    else
      max = temp if temp > max
      temp = 0
    end
  end

  max

end

list = [5, 3, -7]
p largest_contiguous_subsum(list) #8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])




