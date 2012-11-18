require 'new_brew_form'
require 'brewery/use_cases/retrieve_a_brew'
require 'brewery/use_cases/retrieve_list_of_brews'

class BrewsController < ApplicationController
  def index
    @brews = Brewery::UseCase::RetrieveListOfBrews.new.execute
  end

  def show
    results = Brewery::UseCase::RetrieveABrew.new(params[:id]).execute
    @brew = results[:brew]
    @grains = results[:grains]
    @hops = results[:hops]
  end

  def new
    @brew = Forms::NewBrew.new
  end

  def create
    @brew = Forms::NewBrew.new(params[:brew])

    if @brew.save
      redirect_to brews_url
    else
      render :new
    end
  end
end
