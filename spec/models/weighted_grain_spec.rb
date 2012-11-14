require 'spec_helper'

describe WeightedGrain do
  it_should_behave_like Interface::WeightedGrain, WeightedGrain.new
end

