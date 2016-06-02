class Bstree
	attr_accessor :value, :parent, :lchild, :rchild
	def initialize(val, par)
		@value = val
		@parent = par
		@lchild = nil
		@rchild = nil
	end
end

def buildTree(ary, root)
	while !ary.empty? do
		num = rand(1..ary.length) - 1
		item = ary.delete_at(num)
		#puts "--------------------------------------------"
		#puts "num #{num} item #{item} length #{ary.length}"

		if root.value == nil && root.parent == nil
			root.value = item
			#puts "root item #{item} added"
		else
			root = addElement(item, root)
		end
	end
	displayTree(root)
	return root
end

def addElement(item, root)
	# puts "in addElement"
	if root.value >= item
		#go left
		if root.lchild == nil
			# leaf found, add node
			leaf = Bstree.new(item, root)
			#puts "Added left leaf #{leaf.value} parent #{leaf.parent.value}"
			root.lchild = leaf
		else
			# leaf not found, go deeper
			addElement(item, root.lchild)
		end
	elsif root.value < item
		# go right
		if root.rchild == nil
			#leaf found, add node
			leaf = Bstree.new(item, root)
			#puts "Added right leaf #{leaf.value} parent #{leaf.parent.value}"
			root.rchild = leaf
		else
			# leaf not found, go deeper
			addElement(item, root.rchild)
		end
	end
	return root
end

def displayTree(root)
	if root != nil && root.value !=  nil
		print " value #{root.value} "
		if root.lchild != nil 
			print "lchild #{root.lchild.value} "
		end
		if root.rchild != nil 
			print "rchild #{root.rchild.value} "
		end
		puts ""
		displayTree(root.lchild)
		displayTree(root.rchild)
	end
end

def breadth_first_search(val, root)
	search_ended = false
	search_queue = []
	visited_nodes = []
	current_node = nil
	while !search_ended do
		if current_node == nil
			current_node = root
		elsif !search_queue.empty?
			current_node = search_queue.shift
		else
			search_ended = true
			return nil
		end
		visited_nodes << current_node.value
		if current_node.lchild != nil
			search_queue.push(current_node.lchild)
		end
		if current_node.rchild != nil
			search_queue.push(current_node.rchild)
		end
		if current_node.value == val 
			search_ended = true
			return current_node
		end
		puts "visited nodes #{visited_nodes}"
		puts "search_queue next: #{search_queue[0].value}"
	end
end

def dfs_rec(val, root)
	current_node = root
	search_ended = false
	if current_node != nil
		puts "dfs visited node #{current_node.value}"
		if current_node.value == val
			#puts " value found!"
			search_ended = true
			return current_node
		end
	end
	if current_node.lchild != nil && !search_ended
		x = dfs_rec(val, current_node.lchild)
		if x != nil
			search_ended = true
			return x
		end	
	end
	if current_node.rchild != nil && !search_ended
		x = dfs_rec(val, current_node.rchild)
		if x != nil
			search_ended = true
			return x
		end	
	end
end

#x = Bstree.new(13, "something")
#puts " value #{x.value} parent #{x.parent}"
x  = buildTree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324], Bstree.new(nil, nil))
#puts "Breadth first search result: "+breadth_first_search(67, x).value.to_s
puts "Depth first search result: "+dfs_rec(67, x).value.to_s