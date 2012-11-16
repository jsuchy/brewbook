require 'spec_helper'
require 'brewery/use_cases/retrieve_list_of_brews'

describe Brewery::UseCase::RetrieveListOfBrews do
  let(:use_case) { Brewery::UseCase::RetrieveListOfBrews.new }

  context "when there are 2 saved Brews" do
    before do
      Records::Brew.new(:name => "Brown Ale").save
      Records::Brew.new(:name => "White Ale").save
    end

    describe "#execute" do
      describe "the returned brews" do
        let(:brews) { use_case.execute }

        it "have a size of 2" do
          expect(brews.size).to eq(2)
        end

        it "include the 2 saved brews" do
          expect(brews.map(&:name)).to include("Brown Ale")
          expect(brews.map(&:name)).to include("White Ale")
        end

        it "they have a timestamp" do
          brews.each { |brew| expect(brew.created_at).to_not be_nil }
        end
      end
    end
  end
end
