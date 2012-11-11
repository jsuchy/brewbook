class RecipesController < ApplicationController
  def new
    @recipe = Records::Recipe.new
  end
end
