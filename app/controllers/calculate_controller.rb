require 'brewery/use_cases/calculate_strike_temperature_and_volume'

class CalculateController < ApplicationController

  def strike_water_temperature_and_volume
    result = Brewery::UseCase::CalculateStrikeTemperatureAndVolume.new(*_parse_params).execute
    render :json => result
  end

  private

  def _parse_params
    [ params[:pounds], params[:ounces], params[:mashTemperature], params[:waterToGrist] ]
  end

end
