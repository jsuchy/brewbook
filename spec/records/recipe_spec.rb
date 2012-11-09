require 'spec_helper'
require 'records/recipe'

describe Record::Recipe do
  it_should_behave_like Interface::Recipe, Record::Recipe.new

  it "retrives related hops" do
    recipe = Record::Recipe.new
    recipe.save

    hop = Record::Hop.new(:recipe => recipe)
    hop.save

    recipe.hops.first.should == hop
  end

  it "retrives related grains" do
    recipe = Record::Recipe.new
    recipe.save

    grain = Record::WeightedGrain.new(:recipe => recipe)
    grain.save

    recipe.grains.first.should == grain
  end
end
