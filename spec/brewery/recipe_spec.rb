require 'spec_helper'
require 'brewery/recipe'

describe Brewery::Recipe do
  before do
    Brewery::Calc::StrikeWaterTemperature.any_instance.stub(:execute).and_return(10)
    Brewery::Calc::MashWaterVolume.any_instance.stub(:execute).and_return(20)
  end

  describe ".from_params" do
    it "sets name" do
      recipe = Brewery::Recipe.from_params({:name => "Brown Ale"})
      recipe.name.should == "Brown Ale"
    end

    it "sets water_to_grist" do
      recipe = Brewery::Recipe.from_params({:water_to_grist => 1.5})
      recipe.water_to_grist.should == 1.5
    end

    it "sets the target_temperature" do
      recipe = Brewery::Recipe.from_params({:target_temperature => 152})
      recipe.target_temperature.should == 152
    end
  end

  describe ".new" do
    before do
      @recipe = Brewery::Recipe.new("Brown Ale", 1.5, 152)
    end
    it "sets the strike water tempurature" do
      @recipe.strike_water_temperature.should == 10
    end
  end

  describe "#id=" do
    it "sets the water volume" do
      Brewery::Repo::WeightedGrain.stub(:all).and_return([mock("WeightedGrain", :recipe_id => 1, :weight => 1)])
      @recipe = Brewery::Recipe.new("Brown Ale", 1.5, 152)
      @recipe.id = 1
      @recipe.mash_water_volume.should == 20
    end
  end
end
