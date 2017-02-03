class Node
	attr_accessor :position

	def initialize(start_pos=[0,0])
		@position = position
		#@parent = parent
		#@children = possible_positions(position)
	end

	def valid_moves(start_pos)
		#puts start_pos.inspect
		possible_moves = []
		valid = []
		x = start_pos[0]
		#puts x
		y = start_pos[1]

		possible_moves.push(
			[x+2, y+1],
			[x+2, y-1],
			[x+1, y+2],
			[x+1, y-2],
			[x-2, y+1],
			[x-2, y-1],
			[x-1, y+2],
			[x-1, y-2])
		possible_moves.each do |set|
			valid << set if valid_move?(set)
		end
		valid
	end

	def valid_move?(end_pos)
		return true if (end_pos[0] >=0 && end_pos[0] <=7) && (end_pos[0] >=0 && end_pos[0] <=7)
		false
	end

	def knight_moves(start_pos, end_pos)
		final = []
		final << start_pos
		return final if start_pos == end_pos
		array = valid_moves(start_pos)

		if array.include?(end_pos)
			final << end_pos
			return final
		end

		while !array.empty?
			set = array.shift
			final << set
			if valid_moves(set).include?(end_pos)
				final << end_pos
				return
			else
				array << valid_moves(set)
				final.pop
			end
		end	
		final
	end


	def breadth_first_search0(value)
		q = []
		current_node = @top_node
		while !current_node.nil?
			return current_node if current_node.value == value
			q.push current_node.left_child if !current_node.left_child.nil?
			q.push current_node.right_child if !current_node.right_child.nil?
			current_node = q.shift
		end
	end


	def knight_movesX(from, to)
		knight_pos = Node.new(from)

		if from == to
			puts "same"
			return
		else
			moves = possible_moves(from, to).min {|a,b| a.length <=> b.length}
			puts moves.inspect


		end
	end


end

class Game

	def initialize
		@board = []

	end
end

k = Node.new
puts k.shortest_path([0,0],[1,2]).inspect
puts k.shortest_path([0,0],[3,3]).inspect
