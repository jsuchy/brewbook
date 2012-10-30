require 'brewery/use_cases/calculate_strike_temperature_and_volume'

describe Brewery::UseCase::CalculateStrikeTemperatureAndVolume do
  describe "#execute" do
    context "on valid entries" do
      let(:use_case) { Brewery::UseCase::CalculateStrikeTemperatureAndVolume.new("1", "2", "152", "1.6") }

      describe "the result hash" do
        let(:result_hash) { use_case.execute }

        it "valid attribute will be true" do
          result_hash[:valid].should == true
        end

        it "has the correct strike tempurature" do
          result_hash[:strike_water_temperature].should == 162
        end

        it "has the correct mash water volume" do
          result_hash[:mash_water_volume].should == 1.8
        end
      end
    end

    context "when values are blank" do
      let(:use_case) { Brewery::UseCase::CalculateStrikeTemperatureAndVolume.new("", "", "", "") }

      describe "the result hash" do
        let(:result_hash) { use_case.execute }

        it "valid attribute is false" do
          result_hash[:valid].should == false
        end

        it "does not have a strike tempurature key" do
          result_hash.should_not have_key(:strike_water_temperature)
        end

        it "does not have a mash water volume key" do
          result_hash.should_not have_key(:mash_water_volume)
        end

        it "has a errors hash attribute" do
          result_hash.should have_key(:errors)
        end

        describe "errors hash" do
          let(:errors_hash) { result_hash[:errors] }
          [:pounds, :ounces, :mash_temperature, :ratio].each do |attr|
            it "has an error for #{attr}" do
              errors_hash[attr].should == 'is not a valid number.'
            end
          end
        end
      end
    end

    context "when the target temp is over 212 degrees" do
      let(:use_case) { Brewery::UseCase::CalculateStrikeTemperatureAndVolume.new(1, 2, 213, 1.4) }
      describe "the result hash" do
        let(:result_hash) { use_case.execute }

        it "valid attribute is false" do
          result_hash[:valid].should == false
        end

        describe "errors hash" do
          let(:errors_hash) { result_hash[:errors] }
          it "has an error for mash_temperature" do
            errors_hash[:mash_temperature].should == 'can not be greater than 212.'
          end
        end

      end
    end

    context "when the mash tempurature is over 212 degrees and there is no pounds" do
      let(:use_case) { Brewery::UseCase::CalculateStrikeTemperatureAndVolume.new(nil, 2, 213, 1.4) }
      describe "the results hash" do
        describe "errors hash" do
          let(:errors_hash) { use_case.execute[:errors] }
          it "has an error for BOTH the mash tempurature and pounds" do
            errors_hash[:mash_temperature].should == 'can not be greater than 212.'
            errors_hash[:pounds].should == 'is not a valid number.'
          end
        end
      end
    end
  end
end
