require 'spec_helper'

describe Records::Brew do
  it_should_behave_like Interface::Brew, Records::Brew.new

  it "retrives related hops" do
    brew = Records::Brew.new
    brew.save

    hop = Records::Hop.new(:brew => brew)
    hop.save

    brew.hops.first.should == hop
  end

  it "retrives related grains" do
    brew = Records::Brew.new
    brew.save

    grain = Records::WeightedGrain.new(:brew => brew)
    grain.save

    brew.grains.first.should == grain
  end
end
