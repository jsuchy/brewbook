require 'spec_helper'
require 'rails_helper'

describe Hop do
  it_should_behave_like Interface::Hop, Hop.new
end


