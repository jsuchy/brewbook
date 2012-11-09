require 'spec_helper'
require 'records/weighted_grain'

describe Record::WeightedGrain do
  it_should_behave_like Interface::WeightedGrain, Record::WeightedGrain.new
end

