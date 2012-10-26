require 'spec_helper'
require 'brewery/grain'

describe Brewery::Grain do
  describe "instance" do
    before do
      @grain = Brewery::Grain.new(1, "Wheat")
    end

    it "has a name" do
      @grain.name.should == "Wheat"
    end
  end

  describe "class" do
    it "can retrive all of its grains" do
      @grains = [Brewery::Grain.new(1, "Wheat"), Brewery::Grain.new(2, "Chocolate")] 
      Brewery::Loader::Grain.any_instance.should_receive(:execute).and_return(@grains)

      Brewery::Grain.all.should == @grains
    end
  end
end
