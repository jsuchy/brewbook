require 'spec_helper'
require 'records/recipe'

describe Record::Recipe do
  it_should_behave_like Interface::Recipe, Record::Recipe.new
end
