require 'spec_helper'
require 'records/weighted_grain'

describe Records::WeightedGrain do
  it_should_behave_like Interface::WeightedGrain, Records::WeightedGrain.new
end

