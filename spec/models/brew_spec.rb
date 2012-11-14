require 'spec_helper'

describe Brew do
  it_should_behave_like Interface::Brew, Brew.new

  it "retrives related hops" do
    brew = Brew.new
    brew.save

    hop = Hop.new(:brew => brew)
    hop.save

    brew.hops.first.should == hop
  end

  it "retrives related grains" do
    brew = Brew.new
    brew.save

    grain = WeightedGrain.new(:brew => brew)
    grain.save

    brew.grains.first.should == grain
  end
end
