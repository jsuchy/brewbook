require 'spec_helper'

shared_examples "should generate a label and an input" do
  it "should generate a label and an input" do
    expect(generated.css("label").first).to_not be_nil
    expect(generated.css("input").first).to_not be_nil
  end
end

describe "BootstrapFormBuilder" do
  subject(:builder) do
    mock = stub(:name => "Eric", :isTrue => true, :number => 5, :new? => true)
    BootstrapFormBuilder.new(:recipe, mock, helper, {}, nil) 
  end

  describe "#text_field" do
    let(:generated) { Nokogiri::HTML(builder.text_field(:name)) }
    
    include_examples "should generate a label and an input"
  end

  describe "#text_area" do
    let(:generated) { Nokogiri::HTML(builder.text_area(:name)) }
    
    it "should generate a label and an textarea" do
      expect(generated.css("label").first).to_not be_nil
      expect(generated.css("textarea").first).to_not be_nil
    end
  end

  describe "#check_box" do
    let(:generated) { Nokogiri::HTML(builder.check_box(:isTrue)) }
    
    include_examples "should generate a label and an input"

    it "should wrap the input with a label" do
      expect(generated.css("label input").first).to_not be_nil
    end
  end

  describe "#number_field" do
    let(:generated) { Nokogiri::HTML(builder.number_field(:number)) }
    
    include_examples "should generate a label and an input"

    describe "the input" do
      let(:input) { generated.css("input").first }

      it "has a type of number" do
        expect(input.attr('type')).to eq("number")
      end

      it "has a step of 0.1" do
        expect(input.attr('step')).to eq("0.1")
      end
    end

    context "with an add on" do
      let(:generated) { Nokogiri::HTML(builder.number_field(:number, :addon => "a")) }

      describe "the input-append div" do
        let(:input_append) { generated.css(".input-append").first }

        it "has a input and a span" do
          expect(input_append.css("input").first).to_not be_nil
          expect(input_append.css("span").first).to_not be_nil
        end

        it "the span contains the addon" do
          expect(input_append.css("span").first.text).to eq("a")
        end

      end
    end
  end

  describe "#button" do
    let(:generated) { Nokogiri::HTML(builder.button) }

    describe "the generated button" do
      let(:button) { generated.css("button").first }

      it "has the vaue of 'save'" do
        expect(button.text).to eq("Save")
      end
    end
  end

end

