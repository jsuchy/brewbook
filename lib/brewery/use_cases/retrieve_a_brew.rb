require 'brewery/brew'
require 'brewery/hop'
require 'brewery/weighted_grain'

module Brewery
  module UseCase
    class RetrieveABrew

      def initialize(id)
        @id = id
      end

      def execute
        brew_record = Records::Brew.get(@id)

        hops = Records::Hop.all(:brew => brew_record).map do |hop| 
          Brewery::Hop.from_params(hop.attributes) 
        end

        grains = Records::WeightedGrain.all(:brew => brew_record).map do |grain|
          Brewery::WeightedGrain.from_params(grain.attributes)
        end

        {
          :brew => Brewery::Brew.from_params(brew_record.attributes),
          :hops => hops,
          :grains => grains
        }
      end

    end
  end
end
