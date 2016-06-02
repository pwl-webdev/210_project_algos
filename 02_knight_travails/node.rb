class Node
	attr_accessor :valx, :valy, :board, :children_list, :parent
	def initialize(x,y, par, bd)
		@valx = x
		@valy = y
		@parent = par
		@board = nil
		if bd != nil
			@board = Marshal.load( Marshal.dump(bd))
		else
			@board = Array.new(8) {Array.new(8,"o")}
		end
		@children_list = []
		@board[x][y] = "x"
	end

	def find_all_moves
		a = 2
		b = 1
		#puts @board
		if !board[valx+a].nil? && !board[valx+a][valy+b].nil? 
			if board[valx+a][valy+b] == "o"
				#puts "1 Trying to add child #{valx+a} #{valy+b}"
				x = Node.new(valx+a,valy+b, self, self.board)
				self.children_list << x
				#puts "1 Added children #{valx+a} #{valy+b}"
				self.children_list[-1].find_all_moves
			end			
		end
		if !board[valx+a].nil? && !board[valx+a][valy-b].nil? 
			if board[valx+a][valy-b] == "o"
				#puts "2 Trying to add child #{valx+a} #{valy-b}"
				x = Node.new(valx+a,valy-b, self, self.board)
				self.children_list << x
				#puts "2 Added children #{valx+a} #{valy-b}"
				self.children_list[-1].find_all_moves
			end			
		end
		if !board[valx-a].nil? && !board[valx-a][valy-b].nil? && (valx-a) >= 0 && (valy-b) >= 0
			if board[valx-a][valy-b] == "o"
				#puts "3 Trying to add child #{valx-a} #{valy-b}"
				x = Node.new(valx-a,valy-b, self, self.board)
				self.children_list << x
				#puts "3 Added children #{valx-a} #{valy-b}"
				self.children_list[-1].find_all_moves
			end			
		end
		if !board[valx-a].nil? && !board[valx-a][valy+b].nil? && (valx-a) >= 0 
			if board[valx-a][valy+b] == "o"
				#puts "4 Trying to add child #{valx-a} #{valy+b}"
				x = Node.new(valx-a,valy+b, self, self.board)
				self.children_list << x
				#puts "4 Added children #{valx-a} #{valy+b}"
				self.children_list[-1].find_all_moves
			end			
		end
		###########################################################################
		if !board[valx+b].nil? && !board[valx+b][valy+a].nil? 
			if board[valx+b][valy+a] == "o"
				#puts "5 Trying to add child #{valx+b} #{valy+a}"
				x = Node.new(valx+b,valy+a, self, self.board)
				self.children_list << x
				#puts "5 Added children #{valx+b} #{valy+a}"
				self.children_list[-1].find_all_moves
			end			
		end
		if !board[valx+b].nil? && !board[valx+b][valy-a].nil? 
			if board[valx+b][valy-a] == "o"
				#puts "6 Trying to add child #{valx+b} #{valy-a}"
				x = Node.new(valx+b,valy-a, self, self.board)
				self.children_list << x
				#puts "6 Added children #{valx+b} #{valy-a}"
				self.children_list[-1].find_all_moves
			end			
		end
		if !board[valx-b].nil? && !board[valx-b][valy-a].nil? && (valx-b) >= 0 && (valy-a) >= 0
			if board[valx-b][valy-a] == "o"
				#puts "7 Trying to add child #{valx-b} #{valy-a}"
				x = Node.new(valx-b,valy-a, self, self.board)
				self.children_list << x
				#puts "7 Added children #{valx-b} #{valy-a}"
				self.children_list[-1].find_all_moves
			end			
		end
		if !board[valx-b].nil? && !board[valx-b][valy+a].nil? && (valx-b) >= 0 
			if board[valx-b][valy+a] == "o"
				#puts "8 Trying to add child #{valx-b} #{valy+a}"
				x = Node.new(valx-b,valy+a, self, self.board)
				self.children_list << x
				#puts "8 Added children #{valx-b} #{valy+a}"
				self.children_list[-1].find_all_moves
			end			
		end		
	end

	def displayTree
		puts "x:#{self.valx} y:#{self.valy} children_list:#{self.children_list.length} obj_id #{self} board id #{self.board.object_id}"
		self.children_list.each do |item|
			item.displayTree
		end
	end
end

x = Node.new(1,5, nil, nil)
x.find_all_moves
x.board
x.displayTree