require 'brewery/brew'
require 'brewery/hop'
require 'brewery/weighted_grain'
require 'brewery/use_cases/create_a_brew'
require 'brewery/use_cases/retrieve_list_of_brews'

class BrewsController < ApplicationController
  def index
    @brews = Brewery::UseCase::RetrieveListOfBrews.new.execute
  end

  def new
    @brew = Brewery::Brew.new
  end

  def create
    options = params[:brew].clone

    options[:hops] = options[:hops].values.map { |hop| Brewery::Hop.from_params(hop) }
    options[:grains] = options[:grains].values.map { |grain| Brewery::WeightedGrain.from_params(grain) }

    Brewery::UseCase::CreateABrew.new(options).execute
    redirect_to brews_url
  end
end
