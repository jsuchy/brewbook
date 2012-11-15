module Interface
  module Brew; end
end

shared_examples_for Interface::Brew do |host|
  has_properties host, :name, :mash_time, :mash_temp, :yeast,
                       :yeast_amount, :fermentation_temperature,
                       :fermentation_duration, :pre_boil_gravity,
                       :original_gravity, :final_gravity, :created_at
end
