require 'brewery/calcs/strike_water_temperature'
require 'brewery/calcs/mash_water_volume'

module Brewery
  module UseCase
    class CalculateStrikeTemperatureAndVolume
      NUMBER_REGEX = /^\d*\.?\d+$/

      def initialize(pounds, ounces, mash_temperature, ratio)
        @pounds = pounds
        @ounces = ounces
        @mash_temperature = mash_temperature
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

      attr_reader :pounds, :mash_temperature, :ratio

      def _valid?
        _validate_number & _validate_mash_temperature
      end

      def _validate_number
        valid = true
        [:pounds, :ounces, :mash_temperature, :ratio].each do |attr|
          unless NUMBER_REGEX === _get_attr(attr).to_s
            valid = false
            @errors[attr] = "is not a valid number."
          end
        end
        valid
      end

      def _validate_mash_temperature
        mash_temperature = _get_attr(:mash_temperature).to_f
        if mash_temperature > 212
          @errors[:mash_temperature] = "can not be greater than 212."
          return false
        end

        true
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
        Brewery::Calc::StrikeWaterTemperature.new(mash_temperature, ratio).execute
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
