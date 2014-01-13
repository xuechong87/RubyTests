#alias methods 
begin
	class C1 < Object
		def m1
			p "m1"
		end
	
		alias mm m1#给m1起别名
	end

	c = C1.new

	c.m1 
	c.mm
rescue Exception => e
	p e
end

p "============================================================="

#alias methods 
begin
	class C1 < Object
		def m1
			p "m1"
		end
	
		alias mm m1#给m1起别名
		#undef m1#删除以前的方法后新的仍然可用
	end

	c = C1.new

	c.mm
rescue Exception => e
	p e
end

p "end"
gets "end"