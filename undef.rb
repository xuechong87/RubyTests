#undef methods 
begin
	class C1 < Object
		def m1
			p "m1"
		end
	end

	class C2 < C1
		def m2
			p "m2"
		end
	end

	c = C2.new
	c.m1
	c.m2

	class C2
		undef_method m1
		undef m2
	end

	c.m1 #NO method error :undefined method 
	c.m2
rescue Exception => e
	p e
end

#remove methods
begin
	class C1 < Object
		def m1
			p "m1"
		end
	end

	class C2 < C1
		def m2
			p "m2"
		end
	end

	c = C2.new
	c.m1
	c.m2

	class C2
		remove_method :m1
		remove_method :m2
	end

	c.m1 #NO method error :undefined method 
	c.m2
rescue Exception => e
	p e
end

p "end"
gets "end"