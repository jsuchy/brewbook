require 'brewery/calcs/strike_water_temperature'
require 'brewery/calcs/mash_water_volume'

module Brewery
  module UseCase
    class CalculateStrikeTemperatureAndVolume

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
          begin 
            Float(_get_attr(attr)) 
          rescue
            valid = false
            _add_error(attr, "is not a valid number.")
          end
        end
        valid
      end

      def _validate_mash_temperature
        mash_temperature = @mash_temperature.to_f
        if mash_temperature > 200
          _add_error(:mash_temperature, "cannot be greater than 200.")
          return false
        elsif mash_temperature < 100
          _add_error(:mash_temperature, "cannot be less than 100.")
          return false
        end

        true
      end

      def _add_error(attr, message)
        @errors[attr] ||= message
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
        Brewery::Calc::StrikeWaterTemperature.new(mash_temperature, ratio).calculate
      end

      def _calc_water_volume
        Brewery::Calc::MashWaterVolume.new(_total_weight, ratio).calculate
      end

      def _total_weight
        @pounds.to_f + (@ounces.to_f / 16)
      end

    end
  end
end
