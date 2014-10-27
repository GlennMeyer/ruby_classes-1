class Car
	def initialize()
		@fuel = 10.0
		@distance = 0
		@fuel_used = 0.0
		@money_spent = 0.0
		puts "The initialize method is running automatically."
	end
	
	def fuel_up(gallons)
		@money_spent += gallons * 3.5
		@fuel += gallons
		puts "You are out of gas, so you fueled up."
	end
	
	def drive(miles)
		while miles > 0 do
			if miles >= 20
				@distance += 20
				@fuel -= 1.0
				@fuel_used += 1.0
				miles -= 20
				
				if @fuel < 1.0
					self.fuel_up(10.0)
				end
			
			else
				@distance += miles
				@fuel -= miles / 20.0
				@fuel_used += miles / 20.0
				miles = 0
			end
		end
	end
	
	def get_info
		puts "I'm a car! I've driven #{@distance} miles and have #{@fuel} gallons of gas left."
		if @money_spent > 0.0
			puts "You've spent a total of #{@money_spent} on #{@fuel_used} gallons of gas."
		end
	end
	
end

car_a = Car.new
car_b = Car.new

car_a.drive(10)
car_a.get_info

car_b.drive(500)
car_b.get_info
