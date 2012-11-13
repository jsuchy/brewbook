require 'dm-core'

module Records
  class Recipe
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :fermentation_instructions, String
    property :mash_temp, Float
    property :mash_time, Integer
    property :yeast, String
    property :yeast_amount, String

    has n, :hops, 'Records::Hop'
    has n, :grains, 'Records::WeightedGrain'

  end
end
