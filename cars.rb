class Car
	attr_reader :color, :convertible, :roof_status

	@@total_car_count = 0
	@@cars_per_color = Hash.new(0)

	# This method belongs to the class instead of the instance.
	def self.total_car_count
		@@total_car_count
	end

	def self.cars_per_color
		@@cars_per_color
	end

	def color=(new_color)
		@@cars_per_color[@color] -= 1

		@color = new_color
		@@cars_per_color[new_color] += 1
	end

	def self.most_popular_color
		"The most popular color is #{@@cars_per_color.sort_by{|k,v| v}.reverse.first}"
	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color = "blue")
		@color = color
		@fuel = 10
		@distance = 0

		@@total_car_count += 1
		@@cars_per_color[color] += 1	
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

class ConvertibleCar < Car
	def initialize
		super(color = "blue")
		@roof_status = "up"
	end

	def top_down
		if @roof_status == "up"
			@roof_status = "down"
			"Putting the top down"
		else
			"Top was already down"
		end
	end

	def close_top
		if @roof_status == "down"
			@roof_status = "up"
			"Closing the top"
		else
			"Top was already closed"
		end
	end
end

# car_a = Car.new()
# car_b = Car.new()
# puts car_a
# puts car_b
# car_a.drive(10)
# puts car_a
# puts car_b
# car_a.drive(232)
# car_b.drive(117)
# puts car_a
# puts car_b


# car_a = Car.new("blue")
# puts Car.cars_per_color
# car_b = Car.new("blue")
# puts Car.cars_per_color
# car_b.color=("red")
# puts Car.cars_per_color
# car_c = Car.new("red")
# car_d = Car.new("teal")
# puts Car.cars_per_color

# puts Car.most_popular_color

# car_a = Car.new("blue", true)
# puts car_a.convertible