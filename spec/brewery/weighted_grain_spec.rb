require 'spec_helper'
require 'brewery/weighted_grain'

describe Brewery::WeightedGrain do
  it_should_behave_like Interface::WeightedGrain, Brewery::WeightedGrain.new

  it "calculates its weight correctly" do
    weight = Brewery::WeightedGrain.new("Grain", 1, 16).weight
    expect(weight).to eq(2.0)
  end
end


