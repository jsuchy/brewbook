require 'brewery/calcs/strike_water_temperature'
require 'brewery/calcs/mash_water_volume'
require 'brewery/repos/weighted_grain'

module Brewery
  class Recipe

    def self.from_params(params)
      return self.new(nil) unless params
      self.new(params[:name], params[:water_to_grist], params[:target_temperature])
    end

    attr_reader :name, :water_to_grist, :target_temperature, :strike_water_temperature, :mash_water_volume, :id

    def initialize(name, water_to_grist, target_temperature)
      @name = name
      @water_to_grist = water_to_grist
      @target_temperature = target_temperature
      calculate_strike_water_temperature
    end

    def id=(id)
      @id = id
      calculate_mash_water_volume
    end

    private

    def calculate_strike_water_temperature
      return unless target_temperature && water_to_grist
      @strike_water_temperature = Brewery::Calc::StrikeWaterTemperature.new(target_temperature, water_to_grist).execute

    end

    def calculate_mash_water_volume
      return unless id
      total_pounds = _total_pounds
      return unless total_pounds.to_i > 0 && water_to_grist
      @mash_water_volume = Brewery::Calc::MashWaterVolume.new(_total_pounds, water_to_grist.to_f).execute
    end

    def _total_pounds
      Brewery::Repo::WeightedGrain.all.select do |grain|
        grain.recipe_id.to_i == id.to_i
      end.map(&:weight).map(&:to_f).reduce(:+)
    end

  end
end
