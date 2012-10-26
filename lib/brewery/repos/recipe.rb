module Brewery
  module Repo
    class Recipe

      @@recipes = []

      def self.find(id)
        @@recipes[id.to_i-1]
      end

      def self.update(id, recipe)
        recipe.id = id
        @@recipes[id.to_i-1] = recipe
        recipe
      end

      def initialize(recipe)
        @recipe = recipe
      end

      def save
        @recipe.id = @@recipes.size + 1
        @@recipes << @recipe
        @recipe
      end
      
    end
  end
end
