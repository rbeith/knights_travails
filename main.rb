# Class to produce nodes to keep track of locations while building tree
class Node 
  attr_accessor :location, :distance, :predecessor  
  
  def initialize(location = nil, distance = 0, predecessor = nil)
    @location = location
    @distance = distance 
    @predecessor = predecessor 
  end
end

# Script that creates a game board and a knight.
def make_board 
  board = Array.new(8) { Array.new(8) {|i| i }}      
  knight = "♘"
  # x = rand(7)
  # y = rand(7)
  # board[x][y] = knight
  # puts "start = #{[x, y]}"
  # start = [x, y]
end

# iterate through all possible moves from current location
def counter(node, finish, queue) 
    y = [2, 2, 1, -1, -2, -2, -1, 1]
    x = [1, -1, -2, -2, -1, 1, 2, 2]
    i = y.length - 1
    while i >= 0
      row = node.location[0] + y[i]    
      col = node.location[1] + x[i]
      
      #check if move is allowed
      if row.between?(0,7) && col.between?(0,7) 
        loc = [row, col] 
        i -= 1 
      else
        i -= 2
      end

      # create node and insert into queue
      if loc == finish 
        return node
      else
        new_node = Node.new(loc, node.distance + 1, node)
        queue << new_node
        new_node
      end
      
    end

    # recursively search until path found
    new_node.location == finish ? return : counter(queue.pop, finish, queue)

end

# searches the node tree to print the location of the knight from each node
def print_path(node)
  if node.predecessor == nil
    p node.location
  else
    print_path(node.predecessor)
    p node.location
  end
end

#prints final message 
def print_message(node, finish)
  i = node.distance + 1
  puts "You made it in #{i}" + (i > 1 ? " moves" : " move") + "! Here's your path:"  
  print_path(node)
  p finish
end

# accepts coordinates to find path -- main function
def knight_moves(start, finish)
  board = make_board
  
  q = Queue.new
  q << node = Node.new(start)
  
  answer = counter(node, finish, q)
  print_message(answer, finish)
end

knight_moves([0,0],[1,2])
knight_moves([0,0],[3,3])
knight_moves([3,3],[0,0])
knight_moves([3,3],[4,3])
