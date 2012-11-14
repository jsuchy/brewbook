require 'dm-timestamps'

module Records
  class Brew
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :mash_temp, Float
    property :mash_time, Integer
    property :yeast, String
    property :yeast_amount, String
    property :fermentation_temperature, Integer
    property :fermentation_duration, Integer
    property :pre_boil_gravity, Float
    property :original_gravity, Float
    property :final_gravity, Float
    property :created_at, DateTime

    has n, :hops, 'Records::Hop'
    has n, :grains, 'Records::WeightedGrain'
  end
end
