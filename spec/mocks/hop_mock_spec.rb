require 'spec_helper'

describe Mocks::Hop do
  it_should_behave_like Interface::Hop, Mocks::Hop.new({:weight => 0})
end

