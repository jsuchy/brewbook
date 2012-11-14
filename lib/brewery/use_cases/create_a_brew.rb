module Brewery
  module UseCase
    class CreateABrew
      def initialize(hash)
        @options = hash
      end

      def execute
        grains = @options.delete(:grains) { [] }
        hops = @options.delete(:hops) { [] }

        brew = _save_brew(@options)
        _save_grains(grains, brew)
        _save_hops(hops, brew)

        brew
      end

      private

      def _save_brew(attributes)
        brew = Records::Brew.new(attributes)
        brew.save
        brew
      end

      def _save_grains(grains, brew)
        grains.each do |grain|
          Records::WeightedGrain.new(
            :name => grain.name, :pounds => grain.pounds, 
            :ounces => grain.ounces, :brew => brew
          ).save
        end
      end

      def _save_hops(hops, brew)
        hops.each do |hop|
          Records::Hop.new(
            :name => hop.name, :weight => hop.weight,
            :boil_duration => hop.boil_duration,
            :brew => brew
          ).save
        end
      end
    end
  end
end
