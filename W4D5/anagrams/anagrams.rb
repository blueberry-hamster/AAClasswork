#n!
def first_anagram?(str_1, str_2)
  arr = str_1.split("").permutation.to_a
  arr.map!(&:join)
  arr.include?(str_2)
  
end

#n^2
def second_anagram?(str_1, str_2)
  return false if str_2.length != str_1.length
  
  str_1.each_char do |ch|
    str_2.delete!(ch)
  end
  str_2.empty?
end

#nlog(n)
def third_anagram?(str_1, str_2)
  str_1.split("").sort == str_2.split("").sort
end

#n
def fourth_anagram?(str_1, str_2)
  count_hash = Hash.new(0)
  str_1.each_char do |char|
    count_hash[char] += 1
  end
  str_2.each_char do |char|
    count_hash[char] -= 1
  end
  count_hash.all? { |_, v| v == 0 }
end


p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true