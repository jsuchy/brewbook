module Mocks
  module Records
    class Recipe < Mocks::Base
      attributes :id, :name, :mash_time, :yeast_amount, 
                 :grains, :hops, :mash_temp, :yeast,
                 :fermentation_instructions
    end
  end
end
