module Interface
  module Hop; end
end

shared_examples_for Interface::Hop do |host|
  [:name, :weight, :boil_duration].each do |attr|
    it "responds to #{attr}" do
      host.should respond_to(attr)
    end
  end
  it "has a decimal as a weight" do
    lambda {
      Float(host.weight)
    }.should_not raise_error
  end
end