module Mocks
  class Brew < Mocks::Base
    attributes :id, :name, :mash_time, :yeast_amount, 
               :grains, :hops, :mash_temp, :yeast,
               :fermentation_temperature, 
               :fermentation_duration, :pre_boil_gravity,
               :original_gravity, :final_gravity, :created_at
  end
end

