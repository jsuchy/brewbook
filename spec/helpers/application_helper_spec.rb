require 'spec_helper'

describe ApplicationHelper do
  describe "#link_to_add_fields" do
    before do
      stub_template "brews/_grain_fields.html.erb" => "Hello!"

      brew = Records::Brew.new
      f = ActionView::Helpers::FormBuilder.new(:brew, brew, self, {}, nil)

      @link = Nokogiri.parse(helper.link_to_add_fields("Add Grain", f, :grains)).child
    end

    it "has the text of 'Add Grain'" do
      expect(@link.text).to eq("Add Grain")
    end

    it "has a data-id" do
      expect(@link.attr("data-id")).to_not be_nil
    end

    it "renders the assocated partial in the data-field attribute" do
      expect(@link.attr("data-fields")).to eq("Hello!")
    end
  end

  describe "#bootstrap_form_for" do
    before do
      brew = Records::Brew.new
      html = helper.bootstrap_form_for(brew, :as => :brew, :url => helper.brews_path) do |f|
        f.text_field :name
      end
      @result = Nokogiri.parse(html)
    end

    it "generates both a label and text_field" do
      expect(@result.css("label").first).to_not be_nil
      expect(@result.css("input[type='text']").first).to_not be_nil
    end

    describe "the generated label" do
      before do
        @label = @result.css("label").first
      end

      it "has text of 'Name'" do
        expect(@label.text).to eq("Name")
      end

      it "has a 'for' attribute for the text field" do
        expect(@label.attr('for')).to eq("brew_name")
      end
    end

    describe "the generated field" do
      before do
        @field = @result.css("input[type='text']").first
      end

      it "has a 'name' attribute of 'brew[name]'" do
        expect(@field.attr('name')).to eq("brew[name]")
      end

      it "has an 'id' attribute of 'brew_name'" do
        expect(@field.attr('id')).to eq("brew_name")
      end
    end
  end

  def stub_template(hash)
    view.view_paths.unshift(ActionView::FixtureResolver.new(hash))
  end
end
