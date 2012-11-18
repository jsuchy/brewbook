require 'spec_helper'
require 'new_grain_form'

describe "Forms::NewWeightedGrain" do
  subject { Forms::NewWeightedGrain.new }

  it { should_not be_persisted }
end

