require 'spec_helper'
require 'brewery/hop'

describe Brewery::Hop do
  describe ".from_params" do
    it "assigns its properties correctly" do
      hop = Brewery::Hop.from_params(
        {:name => "Hop", :weight => 3, :boil_duration => 60}
      )

      expect(hop.name).to eq("Hop")
      expect(hop.weight).to eq(3)
      expect(hop.boil_duration).to eq(60)
    end
  end

  it_should_behave_like Interface::Hop, Brewery::Hop.new
end



