require 'spec_helper'
require 'brewery/brew'

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
