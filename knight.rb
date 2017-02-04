class Knight
	attr_accessor :position, :parent

	def initialize(position=[0,0], parent = nil)
		@position = position
		@parent = parent
		#@children = possible_positions(position)
	end

	def valid_moves_for(current_pos)
		#puts current_pos.inspect
		possible_moves = []
		#valid = []
		x = set[0]
		y = set[1]
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
		valid = possible_moves.map do |move|
			valid << move if valid_move?(move)
		end

		puts valid.inspect
		valid
	end

	def valid_move?(new_position)
		return true
		#return true if (new_position[0] >=0 && new_position[0] <=7) && (new_position[1] >=0 && new_position[1] <=7)
		false
	end


	def knight_moves(start_pos, end_pos)
		self.start_pos = start_pos
		@start_pos = start_pos
		final = []
		final << start_pos
		return final if start_pos == end_pos
		array = valid_moves(self.start_pos)

		while !array.empty?

			if array.include?(end_pos)
				puts "array includes end position from the getgo"
				final << end_pos
				return final
			end

			set = array.shift
			puts "set: #{set}"
			#final << set
			if valid_moves(set).include?(end_pos) #|| array.includes?(end_pos)
				#puts 2
				while !set.parent.nil?
					final << set.start_pos
				end


				#puts "valid: #{valid_moves(set).inspect}"
				#final << set
				final << end_pos
				return final
			else
				#puts 3
				#puts "valid: #{valid_moves(set).inspect}"
				valid_moves(set).each {|m| array<<Knight.new(m, set)}
				#final.pop
			end
		end	
		#puts "final: #{final}"
	end


end



k = Knight.new
# puts k.knight_moves([0,0],[1,2]).inspect
#puts k.knight_moves([0,0],[3,3]).inspect
# puts k.knight_moves([3,3],[0,0]).inspect
puts k.knight_moves([3,3],[4,3]).inspect
#=>[3,3], [4,5], [2,4], [4,3]
