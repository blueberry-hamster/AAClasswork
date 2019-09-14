class MyStack
  def initialize 
    @store = []
  end
  
  def push(ele)
    @store << ele
  end

  def pop
    @store.pop
  end
  
  def peek
    @store.last.clone
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end
end