require 'brewery/calcs/strike_water_temperature'
require 'brewery/calcs/mash_water_volume'

module Brewery
  module UseCase
    class CalculateStrikeTemperatureAndVolume
      def initialize(pounds, ounces, target_temp, ratio)
        @pounds = pounds.to_f
        @ounces = ounces.to_f
        @target_temp = target_temp
        @ratio = ratio
      end

      def execute
        result = {}
        result[:strike_water_temperature] = _calc_strike_temp
        result[:mash_water_volume] = _calc_water_volume
        result
      end

      private

      attr_reader :pounds, :target_temp, :ratio

      def _calc_strike_temp
        Brewery::Calc::StrikeWaterTemperature.new(target_temp, ratio).execute
      end

      def _calc_water_volume
        Brewery::Calc::MashWaterVolume.new(_total_weight, ratio).execute
      end

      def _total_weight
        @pounds + (@ounces / 16)
      end

    end
  end
end
