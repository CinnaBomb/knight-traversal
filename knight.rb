class Knight
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
		#puts "x: #{x}   y: #{y}"
		possible_moves.push(
			[x+2, y+1],
			[x+2, y-1],
			[x+1, y+2],
			[x+1, y-2],
			[x-2, y+1],
			[x-2, y-1],
			[x-1, y+2],
			[x-1, y-2])
		#puts possible_moves.inspect
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
			#puts "set: #{set}"
			final << set
			if valid_moves(set).include?(end_pos)
				final << end_pos
				return final
			else
				valid_moves(set).each {|m| array<<m}
				final.pop
			end
		end	
		#puts "final: #{final}"
	end


end


k = Knight.new
puts k.knight_moves([0,0],[1,2]).inspect
puts k.knight_moves([0,0],[3,3]).inspect
puts k.knight_moves([3,3],[0,0]).inspect
puts k.knight_moves([3,3],[4,3]).inspect
