class RaceCars
	attr_accessor :name, :distance, :car_speed

	def initialize(name, track_name)
		if track_name.hours_passed == 0
			@name = name
			@car_speed = rand(60..80)
			@distance = 0
		else
			puts "Cannot add racer, race has already started."
		end
	end

	def racer_info
		puts "#{@name} has a speed of: #{@car_speed} mph"
	end
end

class RaceTracks
	attr_accessor :track_name
	attr_reader :hours_passed

	def initialize(track_name)
		@track_name = track_name
		@hours_passed = 0
	end

	def track_info
		puts "Welcome to the #{@track_name}"
	end

	def start_race(racer_one, racer_two)
		if @hours_passed == 0
			puts "\nAnd they're off!"
			
			@hours_passed += 1
			puts "\nHour #{@hours_passed}: "
			racer_one.racer_info
			racer_two.racer_info
			racer_one.distance += racer_one.car_speed
			racer_two.distance += racer_two.car_speed

			if racer_one.distance > racer_two.distance
				puts "\n#{racer_one.name} is in the lead!"
			elsif racer_one.distance == racer_two.distance
				puts "\nIt is neck and neck from the start!"
			else
				puts "\n#{racer_two.name} is in the lead!"
			end

		else
			puts "Race has already started.  Please use progress_race"
		end
	end

	def progress_race(racer_one, racer_two)
		if @hours_passed <= 4
			puts "\nAnother hour passes!"
			@hours_passed += 1
			puts "\nHour #{@hours_passed}: "

			racer_one.car_speed += rand(0..20)
			puts "#{racer_one.name} has increased speed to #{racer_one.car_speed} mph."
			racer_two.distance += racer_two.car_speed
			puts "#{racer_one.name} has traveled #{racer_one.distance} miles."

			racer_two.car_speed += rand(0..20)
			puts "#{racer_two.name} has increased speed to #{racer_two.car_speed} mph."
			racer_one.distance += racer_one.car_speed			
			puts "#{racer_two.name} has traveled #{racer_two.distance} miles."

			if racer_one.distance > racer_two.distance
				puts "\n#{racer_one.name} is in the lead!"
			elsif racer_one.distance == racer_two.distance
				puts "\nBoth racers will not give up the lead!"
			else
				puts "\n#{racer_two.name} is in the lead!"
			end
		elsif @hours_passed == 5
			if racer_one.distance> racer_two.distance
				puts "\n#{racer_one.name} has won the race!"
			elsif racer_one.distance == racer_two.distance
				puts "\nIt is a tie!"
			else
				puts "\n#{racer_two.name} has won the race!"
			end

			racer_one.car_speed = 0
			racer_two.car_speed = 0
		end
	end		
end

daytona = RaceTracks.new("Daytona 500")
daytona.track_info

glenn = RaceCars.new("Glenn", daytona)

speed_racer = RaceCars.new("Speed Racer", daytona)

daytona.start_race(glenn, speed_racer)
daytona.progress_race(glenn, speed_racer)
daytona.progress_race(glenn, speed_racer)
daytona.progress_race(glenn, speed_racer)
daytona.progress_race(glenn, speed_racer)
daytona.progress_race(glenn, speed_racer)