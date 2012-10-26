require 'spec_helper'

describe GrainsController do
  describe "GET index" do
    before do
      @grains = [Brewery::Grain.new(1, "Wheat"), Brewery::Grain.new(2, "Chocolate")]
      Brewery::Grain.should_receive(:all).and_return(@grains)
    end

    it "assigns all grains to @grains" do
      get :index
      expect(assigns(:grains)).to eq(@grains)
    end

    describe "the JSON response" do

      before do
        get :index, {:format => :json}
      end

      it "is non-empty" do
        response.body.should_not be_empty
      end

      it "has the gains names" do
        body = JSON.parse(response.body)
        grains = body['grains']

        grains.size.should == 2
        grains[0]['name'].should == "Wheat"
      end

      it "has the ids" do
        body = JSON.parse(response.body)
        grains = body['grains']
        grains[0]['id'].should == 1
      end
    end

  end
end
