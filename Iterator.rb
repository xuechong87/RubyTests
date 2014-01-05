class ArrayIterator
	
	def initialize(arr)
		@arr = arr
		@current = 0
	end

	def first()
		@current = 0
	end

	def next()
		@current += 1
	end

	def is_done()
		return @current >=@arr.size()
	end

	def currend_item()
		return arr.get(@current)
	end

end

array = Array.new([1,2,3,4,5,7,87 ])
p array
p "type exit"
gets("exit")