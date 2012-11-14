class BrewsController < ApplicationController
  def new
    @brew = Brew.new
  end
end
