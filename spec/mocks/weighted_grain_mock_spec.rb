require 'spec_helper'

describe Mocks::WeightedGrain do
  it_should_behave_like Interface::WeightedGrain, Mocks::WeightedGrain.new({:weight => 0})
end
