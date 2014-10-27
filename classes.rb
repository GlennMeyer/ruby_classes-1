=begin
puts "What is your favorite terminal command?"
fav_command = gets.chomp

case fav_command
when "ls"
	puts "Lists items in directory"
when "cd"
	puts "Change Directory."
when "mk"
	puts "Makes or renames a file."
else
	puts "Unknown command."
end

abbr = {
	:NSA => "National Security Agency",
	:CIA => "Central Intelligence Agency",
	:FBI => "Federal Bureau of Investigation",
	:NASA => "National Aeronautics and Space Administration",
	:CDC => "Center for Disease Control and Prevention"
}

abbr.each {|key,value| puts "#{key}: #{value}"}

array = ["Mike", "Gilbert", "Gene"]
puts array.index("Gilbert")

hash_a =  { ruby: 'backend', html: 'frontend' }.send(:invert)
puts hash_a
puts 10.send(:/, 3)
puts ['a', 'b', 'c', 'd'].send(:slice, 1, 2)

hash_b =  { :ruby => "backend", :html => "frontend"}.invert
puts hash_b
puts 10 / 3
puts ["a", "b", "c", "d"].slice(1,2)
=end

# class Pet
# 	def speak(sound)
# 		puts "#{sound.capitalize} #{sound}!"
# 	end

# 	def collar(name)
# 		puts "It looks like his name is #{name}"
# 	end

# 	def hungry?(answer)
# 		case answer
# 		when "yes"
# 			puts "Feed him food!"
# 		when "no"
# 			puts "Good boy!"
# 		else
# 			puts "Go outside!"
# 		end
# 	end

# end

# dog = Pet.new
# dog.speak("meow")
# dog.collar("Fido")
# dog.hungry?("yes")

# class Passat
# 	def initialize
# 		@gallons = 14
# 	end

# 	def drive(miles)
# 		@gallons -= (miles / 28.0)
# 		puts "You have #{@gallons} left in the tank"
# 	end

# 	def fill_up
# 		@gallons = 14
# 	end
# end

# glenn = Passat.new

# class Marker
# 	def set_color(my_color)
# 		@color = my_color
# 	end

# 	def write
# 		puts "I am writing with a #{@color} marker."
# 	end
# end

5.send(:*, 5)
"omg".send(:upcase)
['a', 'b', 'c'].send(:at,1)
['a', 'b', 'c'].send(:insert, 2, 'o', 'h', 'n', 'o')
{}.send(:size)
{character: "Mario"}.send(:has_key?,:character)

6 - 32
{html: true, json: false}.keys
"MakerSquare"*6
"MakerSquare".split("a")
['alpha', 'beta'][3]