require 'spec_helper'

describe Mocks::Records::WeightedGrain do
  it_should_behave_like Interface::WeightedGrain, Mocks::Records::WeightedGrain.new({:weight => 0})
end
