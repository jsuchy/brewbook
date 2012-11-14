class Brew
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :fermentation_instructions, String
  property :mash_temp, Float
  property :mash_time, Integer
  property :yeast, String
  property :yeast_amount, String

  has n, :hops, 'Hop'
  has n, :grains, 'WeightedGrain'
end
