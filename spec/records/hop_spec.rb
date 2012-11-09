require 'spec_helper'
require 'records/hop'

describe Record::Hop do
  it_should_behave_like Interface::Hop, Record::Hop.new
end


