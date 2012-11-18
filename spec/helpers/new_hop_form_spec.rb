require 'spec_helper'
require 'new_hop_form'

describe "Forms::NewHop" do
  subject { Forms::NewHop.new }

  it { should_not be_persisted }
end


