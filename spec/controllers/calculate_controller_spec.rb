require 'spec_helper'
require 'rails_helper'
require 'calculate_controller'

describe CalculateController do
  let(:controller) { CalculateController.new }

  describe "#strike_water_temperature_and_volume" do
    before do
      @params = {:pounds => 1, :ounces => 2, :mashTemperature => 3, :waterToGrist => 4}

      @result = {:strike_temperature => 10, :mash_water_volume => 5}
      use_case_mock = stub(:execute => @result)

      Brewery::UseCase::CalculateStrikeTemperatureAndVolume.
        should_receive(:new).
        and_return(use_case_mock)
    end

    it "renders the json result of the use case" do
      post :strike_water_temperature_and_volume, @params
      response.body.should == @result.to_json
    end
    
  end
end
