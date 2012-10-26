require 'spec_helper'

describe RecipesController do

  describe "GET show" do
    before do
      Brewery::Calc::StrikeWaterTemperature.any_instance.should_receive(:execute).and_return(10)
      Brewery::Calc::MashWaterVolume.any_instance.stub(:execute).and_return(20)
      @recipe = Brewery::Repo::Recipe.new(Brewery::Recipe.new("Pale Ale", 1.4, 152)).save
    end
    describe "the response" do
      before do
        get :show, :id => @recipe.id, :format => :json
        @body = JSON.parse(response.body)
      end

      it "has a name" do
        @body['recipe']['name'].should == "Pale Ale"
      end

      it "has a water to grist ratio" do
        @body['recipe']['water_to_grist'].should == 1.4
      end

      it "has a id" do
        @body['recipe']['id'].should == @recipe.id
      end

      it "has a target temperature" do
        @body['recipe']['target_temperature'].should == 152
      end

      it "has a stike water temperature" do
        @body['recipe']['strike_water_temperature'].should == 10
      end
    end
  end

  describe "POST create" do
    describe "the response" do
      before do
        Brewery::Calc::StrikeWaterTemperature.any_instance.stub(:execute).and_return(10)
        Brewery::Calc::MashWaterVolume.any_instance.stub(:execute).and_return(20)
        post :create, :recipe => {:name => "Brown Ale", :water_to_grist => 1.5, :target_temperature => 152}, :format => :json
        @body = JSON.parse(response.body)
      end

      it "is not empty" do
        response.body.should_not be_empty
      end

      it "has the name property" do
        @body['recipe']['name'].should == "Brown Ale"
      end

      it "has the water to grist ratio" do
        @body['recipe']['water_to_grist'].should == 1.5
      end

      it "has the id" do
        @body['recipe']['id'].should_not be_blank
      end

      it "has a target temperature" do
        @body['recipe']['target_temperature'].should == 152
      end

      it "has a stike water temperature" do
        @body['recipe']['strike_water_temperature'].should == 10
      end
    end
  end

  describe "PUT update" do
    before do
      Brewery::Calc::MashWaterVolume.any_instance.stub(:execute).and_return(20)
      @recipe = Brewery::Repo::Recipe.new(Brewery::Recipe.new("Pale Ale", 1.5, 152)).save
    end
    describe "the response" do
      before do
        put :update, :id => @recipe.id, :recipe => {:name => "Brown Ale", :water_to_grist => 2.0, :target_temperature => 152}, :format => :json
        @body = JSON.parse(response.body)
      end

      it "has the same id as the create recipe" do
        @body['recipe']['id'].should == @recipe.id.to_s
      end

      it "updates the name" do
        @body['recipe']['name'].should == "Brown Ale"
      end

      it "updates the water to grist" do
        @body['recipe']['water_to_grist'].should == 2.0
      end
    end
  end
end

