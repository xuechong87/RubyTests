require "delegate"

class Say
	def saysome(str)
		p str
	end
end

simpProxy = SimpleDelegator.new(Say.new())
simpProxy.saysome("test")
p "------------------------------------------"

class Proxy
	def initialize(orig)
		@obj = orig
	end
	def method_missing(name,*args)
		@obj.send(name,*args)
	end
end

proxy = Proxy.new(Say.new())
proxy.saysome("proxy says")

p "-------------------------"

class ImageProxy < Delegator
	#传递延迟生成所需数据
	def initialize(data)
		@data = data
		@image = nil
	end
	#在访问时调查委派对象
	def __getobj__
		if @image = nil
			@image = LoadImage(@data)
		end
		@image
	end
end


p "type exit"
gets ("exit")