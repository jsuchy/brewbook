require 'spec_helper'
require 'brewery/brew'

describe Brewery::Brew do
  it_should_behave_like Interface::Brew, Brewery::Brew.new
end
