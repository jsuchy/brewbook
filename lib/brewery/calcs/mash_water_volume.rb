module Brewery
  module Calc
    class MashWaterVolume

      def initialize(pounds, ratio)
        @pounds = pounds.to_f
        @ratio = ratio.to_f
      end

      def execute
        @result ||= _round_to_tenth(_calc_mash_water_volume)
      end

      private 

      attr_reader :pounds, :ratio

      def _calc_mash_water_volume
        pounds * ratio
      end

      def _round_to_tenth(number)
        (number.to_f * 10).round / 10.0
      end

    end
  end
end
