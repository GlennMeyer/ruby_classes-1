class Cookbook
	attr_accessor :title
	attr_reader :recipes

	def initialize(title)
		@title = title
		@recipes = []
	end

	def add_recipe(recipe)
		@recipes << recipe.title
		@recipes << recipe.ingredients
		@recipes << recipe.steps
		# puts "Added a recipe to the collection: #{recipe.title}"

	end

	def recipe_titles
		puts "Printing all of the recipe names:"
		for i in 0..@recipes.length
			if i % 3 == 0
				puts @recipes[i]
			end
		end
	end

	def recipe_ingredients
		puts "Printing ingredients for all recipes:"
		for i in 1..@recipes.length
			if i % 3 == 1
				puts "These are the ingredients for #{@recipes[i-1]}: #{@recipes[i]}."
			end
		end
	end

	def submit_recipe
		puts "Would you like to submit a recipe? (Yes/No)"
		sel = gets.capitalize.chomp
		if sel == "Yes"
			puts "Title?"
			ttl = gets.chomp

			puts "Ingredients (separated by commas)?"
			ing = gets.chomp
			
			puts "Steps (separated by commas)?"
			stp = gets.chomp

			@recipes << ttl
			@recipes << ing.split(", ")
			@recipes << stp.split(", ")
			
		elsif sel == "No"
			puts "Alrighty then."
		else
			puts "Incorrect input."
		end
	end

	def print_cookbook
		for i in 0...@recipes.length
			y = 0
			if i % 3 == 0
				puts "Recipe Title: #{@recipes[i]}"
				puts "Ingredients:  #{@recipes[i+1].join(", ")}" 
				puts "Steps:        "
				@recipes[i+2].each do |x|
					y += 1
					puts "#{y}.  " + x
				end
				puts "	"
			end
		end
	end

	def search_ingredients
		sel = []

		puts "How many ingredients? (integer)"
		num = gets.to_i

		for i in 1..num
			puts "Ingredient: (one at a time)"
			sel << gets.chomp
		end

		for i in 0..@recipes.length
			if i % 3 == 1
				if @recipes[i].sort == sel.sort 
					puts "Found ingredients!"
					puts "Ingredients contained in recipe: #{@recipes[i-1]}"
				end
			end
		end
	end

end

class Recipe
	attr_accessor :title, :ingredients, :steps

	def initialize(title, ingredients, steps)
		@title = title
		@ingredients = ingredients
		@steps = steps
	end

	def print_recipe
		puts "Recipe Name: #{self.title}"
		puts "Ingredients: #{self.ingredients.join(", ")}"
		puts "Steps: #{self.steps.join(", ")}" 
	end
end