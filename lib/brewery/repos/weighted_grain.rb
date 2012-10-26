module Brewery
  module Repo
    class WeightedGrain

      @@weighted_grains = []

      def self.find(id)
        @@weighted_grains[id.to_i-1]
      end

      def self.all
        @@weighted_grains
      end

      def initialize(weighted_grain)
        @weighted_grain = weighted_grain
      end

      def save
        @weighted_grain.id = @@weighted_grains.size + 1
        @@weighted_grains << @weighted_grain
        @weighted_grain
      end

    end
  end
end
