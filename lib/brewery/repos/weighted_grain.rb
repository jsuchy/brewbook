module Brewery
  module Repo
    class WeightedGrain

      def initialize
        @weighted_grains = []
      end

      def find(id)
        @weighted_grains[id.to_i-1]
      end

      def all
        @weighted_grains
      end

      def save(weighted_grain)
        weighted_grain.id = @weighted_grains.size + 1
        @weighted_grains << weighted_grain
        weighted_grain
      end

    end
  end

  WeightedGrainRepo = Repo::WeightedGrain.new

end
