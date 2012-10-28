require 'spec_helper'
require 'controller_helper'
require 'calculate_controller'

describe CalculateController do
  let(:controller) { CalculateController.new }

  describe "#strike_water_temperature_and_volume" do
    before do
      @result = {strike_temperature: 10, mash_water_volume: 5}
      controller.stub(:params).
        and_return({:pounds => 1, :ounces => 2, :mashTemperature => 3, :waterToGrist => 4})

      use_case_mock = mock("CalculateStrikeTemperatureAndVolume", :execute => @result)

      Brewery::UseCase::CalculateStrikeTemperatureAndVolume.
        should_receive(:new).
        with(1, 2, 3, 4).
        and_return(use_case_mock)
    end

    it "renders the json result of the use case" do
      controller.strike_water_temperature_and_volume
      controller.render_hash.should == {:json => @result}
    end
    
  end
end
