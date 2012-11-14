require 'spec_helper'

describe Records::WeightedGrain do
  it_should_behave_like Interface::WeightedGrain, Records::WeightedGrain.new
end

