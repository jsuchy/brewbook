require 'brewery/recipe'
require 'brewery/repos/recipe'

class RecipesController < ApplicationController
  respond_to :json

  def show
    @recipe = Brewery::Repo::Recipe.find(params[:id])
    render :json => {:recipe => @recipe}
  end

  def create
    recipe = Brewery::Recipe.from_params(params[:recipe])
    @recipe = Brewery::Repo::Recipe.new(recipe).save
    render :json => {:recipe => @recipe}
  end

  def update
    recipe = Brewery::Recipe.from_params(params[:recipe])
    @recipe = Brewery::Repo::Recipe.update(params[:id], recipe)
    render :json => {:recipe => @recipe}
  end
end
