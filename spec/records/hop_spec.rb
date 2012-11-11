require 'spec_helper'
require 'records/hop'

describe Records::Hop do
  it_should_behave_like Interface::Hop, Records::Hop.new
end


