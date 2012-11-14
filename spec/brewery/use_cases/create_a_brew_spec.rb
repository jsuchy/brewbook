require 'spec_helper'
require 'brewery/use_cases/create_a_brew'
require 'brewery/hop'
require 'brewery/weighted_grain'

describe Brewery::UseCase::CreateABrew do
  describe "#execute" do
    let(:name)         { "Brown Ale" }
    let(:grains)       { [ Brewery::WeightedGrain.new("Wheat", 3, 5) ] }
    let(:hops)         { [ Brewery::Hop.new("Chocolate", 3, 55) ] }
    let(:mash_time)    { "60" }
    let(:mash_temp)    { "153" }
    let(:yeast)        { "American Yeast" }
    let(:yeast_amount) { "1 vial in boiled water" }

    let(:fermentation_duration)    { "14" }
    let(:fermentation_temperature) { "65" }

    let(:pre_boil_gravity) { "1.042" }
    let(:original_gravity) { "1.066" }
    let(:final_gravity)    { "1.011" }
    let(:created_at)       { Time.new(2012) }

    let(:default_options) do
      {
        :name => name,
        :grains => grains,
        :hops => hops,
        :mash_temp => mash_temp,
        :mash_time => mash_time,
        :yeast => yeast,
        :yeast_amount => yeast_amount,
        :fermentation_temperature => fermentation_temperature,
        :fermentation_duration => fermentation_duration,
        :pre_boil_gravity => pre_boil_gravity,
        :original_gravity => original_gravity,
        :final_gravity => final_gravity,
        :created_at => created_at
      }
    end

    context "with proper values" do
      let(:use_case) { Brewery::UseCase::CreateABrew.new(default_options) }

      describe "the result" do
        let(:result) { use_case.execute }

        [:name, :yeast, :yeast_amount, :created_at].each do |attr|
          it "has the correct #{attr}" do
            expect(result.send(attr)).to eq(self.send(attr))
          end
        end

        [:mash_time, :fermentation_duration].each do |attr|
          it "has the correct #{attr}" do
            expect(result.send(attr)).to eq(Integer(self.send(attr)))
          end
        end

        [:mash_temp, :fermentation_temperature, :pre_boil_gravity,
         :original_gravity, :final_gravity].each do |attr|
          it "has the correct #{attr}" do
            expect(result.send(attr)).to eq(Float(self.send(attr)))
          end
        end
      end

      describe "the side effects" do
        before(:all) do
          use_case.execute
        end
        it "creates a Brew Record" do
          expect(Records::Brew.count).to eq(1)
        end

        it "creates a WeightedGrain record" do
          expect(Records::WeightedGrain.count).to eq(1)
        end

        it "creates a Hop record" do
          expect(Records::Hop.count).to eq(1)
        end
      end
    end
  end
end
