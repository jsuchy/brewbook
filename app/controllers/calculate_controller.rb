require 'brewery/use_cases/calculate_strike_temperature_and_volume'

class CalculateController < ApplicationController

  def show
  end

  def strike_water_temperature_and_volume
    result = Brewery::UseCase::CalculateStrikeTemperatureAndVolume.new(
      params[:pounds], params[:ounces], params[:mashTemperature], params[:waterToGrist]
    ).execute
    render :json => result
  end

end
