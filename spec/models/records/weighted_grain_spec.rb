require 'spec_helper'

describe Records::WeightedGrain do
  it_should_behave_like Interface::WeightedGrain, Records::WeightedGrain.new

  it "calculates its weight correctly" do
    weight = Records::WeightedGrain.new(:pounds => 1, :ounces => 16).weight
    expect(weight).to eq(2.0)
  end
end

