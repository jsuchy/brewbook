require 'brewery/recipe'
require 'brewery/repos/recipe'

class RecipesController < ApplicationController
  respond_to :json

  attr_accessor :recipe_repo

  def initialize
    super
    self.recipe_repo = Brewery::RecipeRepo
  end

  def show
    @recipe = recipe_repo.find(params[:id])
    render :json => {:recipe => @recipe, :weighted_grains => @recipe.weighted_grains}
  end

  def create
    recipe = Brewery::Recipe.from_params(params[:recipe])
    @recipe = recipe_repo.save(recipe)
    render :json => {:recipe => @recipe}
  end

  def update
    recipe = Brewery::Recipe.from_params(params[:recipe])
    @recipe = recipe_repo.update(params[:id], recipe)
    render :json => {:recipe => @recipe}
  end
end
