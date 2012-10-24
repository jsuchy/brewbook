require 'spec_helper'
require 'brewery/calcs/strike_water_temperature'

describe Brewery::Calc::StrikeWaterTemperature do

  context "when the target temp is 154 and ratio is 2.0" do
    before do
      @strike_water_calc = Brewery::Calc::StrikeWaterTemperature.new(154, 2.0)
    end

    describe "the result of 162.2" do
      before do
        @result = @strike_water_calc.execute
      end

      it "rounds down to 162" do
        @result.should == 162
      end
    end

  end
end
