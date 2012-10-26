require 'brewery/weighted_grain'
require 'brewery/repos/weighted_grain'

class WeightedGrainsController < ApplicationController

  attr_accessor :grain_repo

  def initialize
    super
    self.grain_repo = Brewery::WeightedGrainRepo
  end

  def show
    @grain = grain_repo.find(params[:id])
    render :json => {:weighted_grain => @grain}
  end

  def create
    grain = Brewery::WeightedGrain.from_params(params[:weighted_grain])
    @weighted_grain = grain_repo.save(grain)
    render :json => {:weighted_grain => @weighted_grain}
  end
end
