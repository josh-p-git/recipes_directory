require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

DatabaseConnection.connect('recipes_directory')

recipes_directory = RecipeRepository.new

recipes_directory.all.each do |recipe|
    p recipe
end

recipe = recipes_directory.find(1)
puts "#{recipe.name + " - " + recipe.cooking_time + " - " + recipe.rating}"