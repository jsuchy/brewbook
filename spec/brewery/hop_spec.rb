require 'spec_helper'
require 'brewery/hop'

describe Brewery::Hop do
  it_should_behave_like Interface::Hop, Brewery::Hop.new
end



