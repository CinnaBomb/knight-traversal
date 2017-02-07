class Knight
	attr_accessor :position, :parent, :children

	def initialize(position=[0,0], parent = nil)
		@position = position
		@parent = parent
		@children = possible_moves_for(position)
	end

	#returns array of possible moves for position
	#only used to create children of nodes
	def possible_moves_for(position)
		possible_moves = []

		x = position[0]
		y = position[1]
		possible_moves.push(
			[x+1, y+2],
			[x-2, y-1],
			[x+2, y-1],
			[x+2, y+1],
			[x-2, y+1],
			[x-1, y-2],
			[x-1, y+2],
			[x+1, y-2])

		possible_moves
	end

	#returns array of valid nodes from children(possible_moves) at position
	def valid_moves_for(position, possible_moves)
		valid = []
		parent_node = self

		possible_moves.each do |new_position|
			valid << Knight.new(new_position, parent_node) if valid_move?(new_position) == true
		end
		valid
	end

	#check whether move is on board
	def valid_move?(new_position)
		if (new_position[0] >=0 && new_position[0] <=7) && 
			(new_position[1] >=0 && new_position[1] <=7) 
			return true
		end
		false
	end

	#returns array of the node path
	def path(node)
		arr = [node.position]

		while node.parent != nil
			node = node.parent
			arr.unshift(node.position)
		end
		arr
	end

	#returns path of node
	def knight_moves(start_pos, end_pos)
		self.position = start_pos
		node = self

		if node.position == end_pos
			return path(node)
		end

		parent_node = self
		nodes = valid_moves_for(start_pos, self.children)

		until nodes.empty?
			node = nodes.shift
			if node.position == end_pos
				return path(node)
			else
				parent_node = node
				valid_moves_for(node.position, node.children).each do |n|
					n.parent = parent_node
					nodes << n
				end
			end
		end
	end

end




# 	k = Knight.new

# puts k.knight_moves([3,3],[3,3]).inspect
# puts k.knight_moves([0,0],[1,2]).inspect
# puts k.knight_moves([0,0],[3,3]).inspect
# puts k.knight_moves([3,3],[0,0]).inspect
# puts k.knight_moves([0,0],[7,7]).inspect
# puts k.knight_moves([3,3],[4,3]).inspect
#k.knight_moves([3,3],[4,3])
#=>[3,3], [4,5], [2,4], [4,3]

