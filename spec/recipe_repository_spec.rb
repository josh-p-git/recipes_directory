require 'recipe_repository'

RSpec.describe RecipeRepository do

    def reset_recipies_table
        seed_sql = File.read('spec/seeds_recipes.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_recipies_table
    end

    it 'returns the list of recipies' do
        repo = RecipeRepository.new

        recipe = repo.all
        expect(recipe.length).to eq(2)
        expect(recipe.first.id).to eq("1")
        expect(recipe.first.name).to eq('Spaghetti')
        expect(recipe.first.cooking_time).to eq("30")
        expect(recipe.first.rating).to eq("4")
    end

    it 'returns Spaghetti as a single result' do
        repo = RecipeRepository.new

        recipe = repo.find(1)
        expect(recipe.name).to eq('Spaghetti')
        expect(recipe.cooking_time).to eq("30")
        expect(recipe.rating).to eq("4")
    end

    it 'returns Pizza as a single result' do
        repo = RecipeRepository.new

        recipe = repo.find(2)
        expect(recipe.name).to eq('Pizza')
        expect(recipe.cooking_time).to eq("15")
        expect(recipe.rating).to eq("5")
    end

end