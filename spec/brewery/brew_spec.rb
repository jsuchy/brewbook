require 'spec_helper'
require 'brewery/brew'

describe Brewery::Brew do
  describe ".from_params" do
    it "assigns its properties correctly" do
      time = Time.now
      brew = Brewery::Brew.from_params(
        {:name => "Brown Ale", :pre_boil_gravity => 1.001, :created_at => time}
      )

      expect(brew.name).to eq("Brown Ale")
      expect(brew.pre_boil_gravity).to eq(1.001)
      expect(brew.created_at).to eq(time)
    end
  end

  it_should_behave_like Interface::Brew, Brewery::Brew.new

end
