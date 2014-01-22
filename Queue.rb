begin
	require "thread"
	q = Queue.new

	producer = Thread.new{
		10.times { |i| 
			q.push(i)
			sleep(1)
		}
		q.push(nil)
	}

	consumer = Thread.new{
		loop { 
			i = q.pop
			break if i==nil
			puts i
		}
	}
rescue Exception => e
	p e
end

p "end"

gets "exit"