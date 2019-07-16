require 'set'
require "byebug"

class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

def bfs(starting_node, target_value)
    visited = []
    
    queue = [starting_node]
    until queue.empty?
        curr_node = queue.shift
        
        unless visited.include?(curr_node.val)
            return curr_node if curr_node.val == target_value
            visited.push(curr_node.val)
            queue.concat(curr_node.neighbors)
        end
    end

    return nil
end

p bfs(a, "b")
p bfs(a, "f")
