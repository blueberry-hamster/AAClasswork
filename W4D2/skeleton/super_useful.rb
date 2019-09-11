# PHASE 2
# def convert_to_int(str)
#   # Integer(str)
#   if is_num_str?(str)
#     Integer(str)
#   else
#     nil
#   end
# end

# def is_num_str?(str)
#   num_str = "0123456789"
#   str.split("").all? { |char| num_str.include?(char) }
# end

  def convert_to_int(str)
    begin
      Integer(str)
    rescue ArgumentError 
      nil
    end
  end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    
    raise StandardError 
    
  end 
end

class NotCoffee < StandardError
  def initialize(msg="This isn't a coffee")
    super
  end
end

def feed_me_a_fruit
  begin
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  
    reaction(maybe_fruit) 
  rescue
    puts "Give me a coffee if you want another try"
    maybe_coffee = gets.chomp
    if maybe_coffee == "coffee"
      retry  
    else
      raise NotCoffee
    end
  end

end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


