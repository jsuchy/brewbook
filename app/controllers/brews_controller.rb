require 'brewery/brew'

class BrewsController < ApplicationController
  def new
    @brew = Brewery::Brew.new
  end
end
