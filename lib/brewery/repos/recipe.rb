module Brewery
  module Repo
    class Recipe

      def initialize
        @recipes = []
      end

      def find(id)
        @recipes[id.to_i-1]
      end

      def update(id, recipe)
        recipe.id = id
        @recipes[id.to_i-1] = recipe
        recipe
      end

      def save(recipe)
        recipe.id = @recipes.size + 1
        @recipes << recipe
        recipe
      end
      
    end
  end

  RecipeRepo = Repo::Recipe.new
end
