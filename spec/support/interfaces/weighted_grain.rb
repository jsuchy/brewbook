module Interface
  module WeightedGrain; end
end

shared_examples_for Interface::WeightedGrain do |host|
  has_properties host, :name, :pounds, :ounces, :weight
end
