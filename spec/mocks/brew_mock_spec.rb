require 'spec_helper'

describe Mocks::Brew do
  it_should_behave_like Interface::Brew, Mocks::Brew.new({})
end
