require 'spec_helper'

describe WeightedGrainsController do
  before do
    @grain_repo = Brewery::Repo::WeightedGrain.new
  end
  
  describe "GET show" do
    before do
      @grain = @grain_repo.save(Brewery::WeightedGrain.new(10, 1, 2))
    end

    describe "the response" do
      before do
        controller.grain_repo = @grain_repo
        get :show, :id => @grain.id, :format => :json
        @body = JSON.parse(response.body)
      end

      it "has a weight" do
        @body['weighted_grain']['weight'].should == 10
      end

      it "has a grain_id" do
        @body['weighted_grain']['grain_id'].should == 2
      end

      it "has a recipe_id" do
        @body['weighted_grain']['recipe_id'].should == 1
      end

      it "has a id" do
        @body['weighted_grain']['id'].should == @grain.id
      end
    end
  end

  describe "POST create" do
    it "gives a non-empty json response" do
      controller.grain_repo = @grain_repo
      post :create, :weighted_grain => {:weight => 10, :grain_id => "1", :recipe_id => "2"}, :format => :json

      response.body.should_not be_empty

      body = JSON.parse(response.body)

      body['weighted_grain']['weight'].should == 10
      body['weighted_grain']['grain_id'].should == 1
      body['weighted_grain']['recipe_id'].should == 2
    end

  end
end
