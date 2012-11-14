require 'spec_helper'

describe "the application" do
  it "loads" do
    get "/"
    expect(response).to be_successful
  end
end
