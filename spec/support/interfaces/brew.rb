module Interface
  module Brew; end
end

shared_examples_for Interface::Brew do |host|
  [ :id, :name, :grains, :hops, :mash_time, :mash_temp, :yeast, 
    :yeast_amount, :fermentation_temperature,
    :fermentation_duration, :pre_boil_gravity, :original_gravity,
    :final_gravity, :created_at ].each do |attr|
    it "responds to #{attr}" do
      host.should respond_to(attr)
    end
  end
end
