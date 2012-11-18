require 'spec_helper'
require 'brewery/brew'
require 'brewery/hop'
require 'brewery/weighted_grain'

describe "brews/index" do
  before do
    brews = [1, 2].map { |i| Mocks::Brew.new(:id => i, :name => "Brew #{i}", :created_at => Time.now) }
    assign(:brews, brews)
    render
  end

  it "renders _brew partial for each brew" do
    expect(view).to render_template(:partial => "_brew", :count => 2)
  end

  it "contains links to view the brews" do
    expect(rendered).to include(brew_path(1))
    expect(rendered).to include(brew_path(2))
  end

end

describe "brews/show" do
  before do
    assign(:brew, Brewery::Brew.from_params(:id => 1, :name => "Brown Ale"))
    assign(:hops, [Brewery::Hop.from_params(:name => "Chocolate")])
    assign(:grains, [Brewery::WeightedGrain.from_params(:name => "Barley")])
    render
  end

  it "displays the brew attributes" do
    expect(rendered).to include("Brown Ale")
  end

  it "displays the hops attributes" do
    expect(rendered).to include("Chocolate")
  end

  it "displays the grains attributes" do
    expect(rendered).to include("Barley")
  end
end

describe "brews/new" do
  before do
    assign(:brew, Brewery::Brew.new)
    render
  end

  describe "the generated form" do
    let(:form) { Nokogiri::HTML(rendered).css("form").first }

    it "has an method of POST" do
      expect(form.attr("method")).to match(/post/i)
    end

    it "has an action of the brews path" do
      expect(form.attr("action")).to eq(brews_path)
    end
  end
end
