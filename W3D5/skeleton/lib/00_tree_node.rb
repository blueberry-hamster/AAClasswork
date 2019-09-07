require "byebug"

class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(p_node)
        return @parent = nil if p_node.nil? 
        @parent.remove_child(self) unless @parent.nil?
        p_node.children << self # unless p_node == @parent
        @parent = p_node
    end
    
    def add_child(c_node)
        c_node.parent = self        
        @children = @children | [c_node]        
    end

    def remove_child(c_node)
        raise if c_node.parent.nil?
        c_node.parent = nil
        @children = @children - [c_node]
    end
    
    def dfs(target) #node is "root" at every itteration
        #base case
        #if we reach leaf, either return nil or node XX
        # debugger
        return self if self.value == target

        #recursive case
        #if with children, itterate over children and dfs on each child
        result = self.children.each { |child| child.dfs(target) } 
        return result unless result.nil?
    end

    def bfs(target)

    end

    # def inspect
    #     "parent: #{@parent} children: #{@children} value: #{@value}"
    # end

end

class Queue


end

