require 'brew'

describe Brew do
  let(:required_fields) do
    {
      "name" => "Pale Ale",
      "brew_date" => Time.now.strftime("%m/%d/%y")
    }
  end

  it "initializes with provided attributes" do
    brew = Brew.new("name" => "Stout", "brew_date" => "12/12/2011")
    brew.name.should == "Stout"
    brew.brew_date.should == "12/12/2011"
  end

  it "validates required fields" do
    Brew.new(required_fields).should be_valid
    Brew.new(required_fields.merge('name' => nil)).should_not be_valid
    Brew.new(required_fields.merge('brew_date' => nil)).should_not be_valid
  end
end
