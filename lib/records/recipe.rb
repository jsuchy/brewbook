require 'dm-core'

module Record
  class Recipe
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :fermentation_instructions, String
    property :mash_time, Integer
    property :yeast, String
    property :yeast_amount, String

    has n, :hops
    has n, :grains

    def mash_temp

    end
  end
end
