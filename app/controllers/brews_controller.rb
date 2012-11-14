class BrewsController < ApplicationController
  def new
    @brew = Records::Brew.new
  end
end
