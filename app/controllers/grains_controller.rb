require 'brewery/grain'

class GrainsController < ApplicationController

  respond_to :json

  def index
    respond_with(@grains = Brewery::Grain.all)
  end
end
