require 'spec_helper'
require 'brewery/use_cases/retrieve_a_brew'

describe Brewery::UseCase::RetrieveABrew do
  describe "#execute" do
    before do
      record = Records::Brew.new(:name => "Ale")
      record.save

      Records::WeightedGrain.new(:brew => record).save
      Records::Hop.new(:brew => record).save

      @id = record.id
    end
    let(:use_case) { Brewery::UseCase::RetrieveABrew.new(@id) }

    describe "the results hash" do
      let(:results_hash) { use_case.execute }

      describe "brew attribute" do
        let(:brew) { results_hash[:brew] }

        it "has the same id as the one we are looking for" do
          expect(brew.id).to eq(@id)
        end
      end

      describe "grains attribute" do
        let(:grains) { results_hash[:grains] }

        it "should only be one" do
          expect(grains.size).to eq(1)
        end
      end

      describe "hops attribute" do
        let(:hops) { results_hash[:hops] }

        it "should only be one" do
          expect(hops.size).to eq(1)
        end
      end
    end
  end
end
