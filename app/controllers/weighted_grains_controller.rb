require 'brewery/weighted_grain'
require 'brewery/repos/weighted_grain'

class WeightedGrainsController < ApplicationController
  def show
    @grain = Brewery::Repo::WeightedGrain.find(params[:id])
    render :json => {:weighted_grain => @grain}
  end

  def create
    grain = Brewery::WeightedGrain.from_params(params[:weighted_grain])
    @weighted_grain = Brewery::Repo::WeightedGrain.new(grain).save
    render :json => {:weighted_grain => @weighted_grain}
  end
end
