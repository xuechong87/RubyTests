Thread.new{
	loop { 
		p "Thread 1"
		sleep 1
	}
}

loop { 

	p "main "

	sleep 3
}