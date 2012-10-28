require 'brewery/calcs/strike_water_temperature'
require 'brewery/calcs/mash_water_volume'

module Brewery
  module UseCase
    class CalculateStrikeTemperatureAndVolume
      NUMBER_REGEX = /^\d*\.?\d+$/

      def initialize(pounds, ounces, target_temp, ratio)
        @pounds = pounds
        @ounces = ounces
        @target_temp = target_temp
        @ratio = ratio
        @errors = {}
      end

      def execute
        return _errors_hash unless _valid?

        result = {}
        result[:strike_water_temperature] = _calc_strike_temp
        result[:mash_water_volume] = _calc_water_volume
        result[:valid] = true
        result
      end

      private

      attr_reader :pounds, :target_temp, :ratio

      def _valid?
        valid = true
        [:pounds, :ounces, :target_temp, :ratio].each do |attr|
          unless NUMBER_REGEX === _get_attr(attr).to_s
            valid = false
            @errors[attr] = "is not a valid number."
          end
        end
        valid
      end

      def _get_attr(attr)
        instance_variable_get(:"@#{attr}")
      end

      def _errors_hash
        result = {}
        result[:valid] = false
        result[:errors] = @errors
        result
      end

      def _calc_strike_temp
        Brewery::Calc::StrikeWaterTemperature.new(target_temp, ratio).execute
      end

      def _calc_water_volume
        Brewery::Calc::MashWaterVolume.new(_total_weight, ratio).execute
      end

      def _total_weight
        @pounds.to_f + (@ounces.to_f / 16)
      end

    end
  end
end
