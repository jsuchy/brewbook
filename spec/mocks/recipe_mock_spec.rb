require 'spec_helper'

describe Mocks::Records::Recipe do
  it_should_behave_like Interface::Recipe, Mocks::Records::Recipe.new({})
end
