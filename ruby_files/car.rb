class Car
	def initialize
		@fuel = 10
		@distance = 0
		Kernel.puts ("the initialize method is running automatically")
	end
	def get_info
		Kernel.puts("I'm a car. I've driven #{@distance} miles and have #{@fuel} gallons of gas left.")
	end
	def drive(miles_driven)
		if @fuel-(miles_driven/20.0) <= 0
	    	puts ("You do not have enough fuel for that, you need to fuel-up")
		else
		@fuel = @fuel-(miles_driven/20.0)	
		@distance = miles_driven+@distance
		end
	end
	def fuel_up
		@price = (10-@fuel)*3.50
		@fuel = 10
		Kernel.puts ("You're tank is now has #{@fuel} gallons. It cost $#{@price}0 to fill up.")
	end
end
