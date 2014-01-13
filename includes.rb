
begin
	module Helper

		def helper
			p "helper"
		end

		def some_method
			p "Helper#some_method"
		end

	end


	class Example < Object
		include Helper

		def some_method #include包含的模块是作为父类处理的所以这里会覆盖
			p "Example#some_method"
		end
	end

	ex = Example.new
	ex.helper
	ex.some_method

rescue Exception => e
	p e
end

p "\r\n"
puts "============================\r\nEND" 
gets "exit"