module Brewery
  module Calc
    class MashWaterVolume

      def initialize(pounds, ratio)
        @pounds = pounds
        @ratio = ratio
      end

      def execute
        @result ||= _calc_mash_water_volume.round(1)
      end

      private 

      attr_reader :pounds, :ratio

      def _calc_mash_water_volume
        pounds * ratio
      end

    end
  end
end
