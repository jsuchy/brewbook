require 'minitest/autorun'
require_relative '../lib/brew'

describe Brew do
  let(:required_fields) do
    {
      "name" => "Pale Ale",
      "brew_date" => Time.now.strftime("%m/%d/%y")
    }
  end

  it "initializes with provided attributes" do
    brew = Brew.new("name" => "Stout", "brew_date" => "12/12/2011")
    brew.name.must_equal "Stout"
    brew.brew_date.must_equal "12/12/2011"
  end

  it "validates required fields" do
    assert Brew.new(required_fields).valid?
    refute Brew.new(required_fields.merge('name' => nil)).valid?
    refute Brew.new(required_fields.merge('brew_date' => nil)).valid?
  end
end
