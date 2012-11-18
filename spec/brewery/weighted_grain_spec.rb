require 'spec_helper'
require 'brewery/weighted_grain'

describe Brewery::WeightedGrain do
  describe ".from_params" do
    it "assigns its properties correctly" do
      grain = Brewery::WeightedGrain.from_params(
        {:name => "Grain", :pounds => 3, :ounces => 4}
      )

      expect(grain.name).to eq("Grain")
      expect(grain.pounds).to eq(3)
      expect(grain.ounces).to eq(4)
    end
  end

  it_should_behave_like Interface::WeightedGrain, Brewery::WeightedGrain.new

  it "calculates its weight correctly" do
    weight = Brewery::WeightedGrain.new("Grain", 1, 16).weight
    expect(weight).to eq(2.0)
  end
end


