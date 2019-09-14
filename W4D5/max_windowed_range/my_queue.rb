class MyQueue
  
  def initialize
    @store = []
  end

  def enqueue(ele)
    @store << ele
    nil
  end

  def dequeue
    @store.shift
  end
  
  def peek
    @store.first.clone
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end

end