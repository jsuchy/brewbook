require 'spec_helper'
require 'records/recipe'

describe Records::Recipe do
  it_should_behave_like Interface::Recipe, Records::Recipe.new

  it "retrives related hops" do
    recipe = Records::Recipe.new
    recipe.save

    hop = Records::Hop.new(:recipe => recipe)
    hop.save

    recipe.hops.first.should == hop
  end

  it "retrives related grains" do
    recipe = Records::Recipe.new
    recipe.save

    grain = Records::WeightedGrain.new(:recipe => recipe)
    grain.save

    recipe.grains.first.should == grain
  end
end
