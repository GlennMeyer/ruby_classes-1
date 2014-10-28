class Person
	attr_accessor :health, :caffeine_level
	attr_reader :name

	def initialize(name)
		@name = name
		@caffeine_level = 100
		@health = 100
	end

	def run
		puts "#{@name} runs for his/her life!"
	end

	def scream
		puts "#{@name} screams in horror!"
	end

	def drink_coffee
		if @caffeine_level <= 85
			@caffeine_level += 15
			"Drinks a cup of coffee."
		elsif @caffeine_level >= 100
			"Fully caffeinated!"
		end
	end
end

module KungFu
	def punch(victim)
		if @caffeine_level >= 5
			puts "#{@name} throws a punch."

			punch = rand(@strength)
			if punch > 5
				puts "#{victim.name} summersaults into the air and takes #{punch} damage!"
			elsif punch == 0
				puts "The #{@name}'s punch does nothing."
			else
				puts "The #{@name} punches #{victim.name} for #{punch} damage."
			end
			victim.health -= punch
			@caffeine_level -= 5

			victim.scream
			victim.run
		else
			puts "Please rest to restore energy."
		end
	end
end

class PowerRanger < Person
	attr_accessor :health, :caffeine_level
	attr_reader :name

	include KungFu

	def initialize(name, color, strength = 10)
		super(name)

		@name = name
		@color = color
		@strength = strength
	end

	def use_megazord(victim)
		if @caffeine_level >= 75
			punch = rand(100..5000)
			puts "Go go Power Rangers!  Megazord attacks #{victim.name} for #{punch} damage."

			victim.health -= punch
			@caffeine_level -= 75
		else
			puts "Not enough energy to summon Megazord.  Let the power ranger rest."
		end
	end

	def rest
		@caffeine_level = 100
		puts "#{@name} is fully rested!"
	end
end

class EvilNinja < Person
	attr_accessor :health
	attr_reader :name

	include KungFu

	def initialize
		super(name)
		@strength = 10
		@evilness = 100

		@name = "Evil Ninja"
	end

	def cause_mayhem(victim)
		if @evilness >= 75
			victim.caffeine_level = 0
			@evilness -= 75

			puts "Evil Ninja causes mayhem draining #{victim.name}'s energy to 0."
		else
			puts "Ninja is not evil enough, he needs rest."
		end
	end
end

def fight_scene
	glenn = Person.new("Glenn")
	steve = Person.new("Steve")

	tommy = PowerRanger.new("Tommy", "Green")
	rocky = PowerRanger.new("Rocky", "Red")

	ninja_a = EvilNinja.new
	ninja_b = EvilNinja.new

	glenn.run
	glenn.scream

	steve.run
	steve.scream

	ninja_a.punch(glenn)
	ninja_a.cause_mayhem(glenn)

	ninja_b.punch(steve)
	ninja_b.cause_mayhem(steve)

	tommy.punch(ninja_a)
	tommy.use_megazord(ninja_a)
	tommy.rest

	rocky.punch(ninja_b)
	rocky.use_megazord(ninja_b)
	rocky.rest
end



# glenn = Person.new("Glenn")
# tommy = PowerRanger.new(10, "red")
# tommy.punch(glenn)