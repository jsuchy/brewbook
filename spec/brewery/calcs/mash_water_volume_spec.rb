require 'spec_helper'
require 'brewery/calcs/mash_water_volume'

describe Brewery::Calc::MashWaterVolume do

  context "when the weight is 20 pounds and the ratio is 2.0" do
    before do
      @mash_water_volume_calc = Brewery::Calc::MashWaterVolume.new(20, 2.0)
    end

    it "calculates water volume to be 40.0" do
      @mash_water_volume_calc.calculate.should == 40.0
    end
  end

  context "when the weight is 15.25 pounds and the ratio is 1.75" do
    before do
      @mash_water_volume_calc = Brewery::Calc::MashWaterVolume.new(15.25, 1.75)
    end

    describe "the result of 26.6875" do
      before do
        @result = @mash_water_volume_calc.calculate
      end

      it "is rounded up to 26.7" do
        @result.should == 26.7
      end
    end

  end

  context "with string inputs of 2.5 and 2.5" do
    before do
      @result = Brewery::Calc::MashWaterVolume.new("2.5", "2.5").calculate
    end

    it "gives a rounded result of 6.3" do
      @result.should == 6.3
    end
  end

end
