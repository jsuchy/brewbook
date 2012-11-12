require 'spec_helper'

describe Mocks::Records::Hop do
  it_should_behave_like Interface::Hop, Mocks::Records::Hop.new({:weight => 0})
end

