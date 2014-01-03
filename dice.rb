class Dice
	def initialize(n)
		@n = n
	end

	def each
		@n.times {
			yield rand(6) + 1
		}
	end
end

dice1 = Dice.new(10)
dice1.each { |x| p x }

p "-----------------------"
class Dice
	#增加功能
	include Enumerable
end

#用继承的reject 排除3以下的结果

p dice1.reject { |x| x<=3 }

p "type exit"
gets ("exit")