require 'spec_helper'

describe Records::Hop do
  it_should_behave_like Interface::Hop, Records::Hop.new
end


