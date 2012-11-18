require 'spec_helper'
require 'new_brew_form'

describe "Forms::NewBrew" do
  subject { Forms::NewBrew.new }

  it { should_not be_persisted }
end
