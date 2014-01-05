begin  
	object = Object.new()

	dog = object.clone()

	def dog.sit
		puts "dog sitting "
	end

	dog.sit()

	myDog = dog.clone()

	myDog.sit()

rescue =>err
	puts err
end
p "exit"
gets ("exit")