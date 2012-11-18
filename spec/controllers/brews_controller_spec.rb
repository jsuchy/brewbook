require 'spec_helper'

describe BrewsController do
  describe "#index" do
    it "displays the :index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns the brews variable" do
      get :index
      expect(assigns(:brews).size).to eq(Records::Brew.count)
    end
  end
  describe "#new" do
    it "displays the :new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "asigns a new brew variable" do
      get :new
      expect(assigns(:brew)).to_not be_nil
    end
  end

  describe "#create" do
    let(:hop) { {:name => "Hop", :weight => "3", :boil_duration => "55" } }
    let(:good_params) do
      { 
        :brew => {
          :name => "Eric",
          :grains_attributes => {"1" => {:name => "Grain", :pounds => "1", :ounces => "3"} },
          :hops_attributes => {"1" => hop },
          :mash_temp => "155",
          :mash_time => "60",
          :yeast => "American Yeast",
          :yeast_amount => "1 vial",
          :fermentation_temperature => "65",
          :fermentation_duration => "14",
          :pre_boil_gravity => "1.001",
          :original_gravity => "1.011",
          :final_gravity => "1.005",
          :created_at => Time.now.midnight,
        }
      }
    end

    context "with good params" do
      it "redirects to the brew list page" do
        post :create, good_params
        expect(response).to redirect_to(brews_path)
      end

      it "creates a brew record" do
        lambda {
          post :create, good_params
        }.should change(Records::Brew, :count)
        expect(Records::Brew.count).to eq(1)
      end

      it "creates 1 weighted grain" do
        lambda {
          post :create, good_params
        }.should change(Records::WeightedGrain, :count)
        expect(Records::WeightedGrain.count).to eq(1)
      end

      it "creates 1 hop" do
        lambda {
          post :create, good_params
        }.should change(Records::Hop, :count)
        expect(Records::Hop.count).to eq(1)
      end
    end

    context "with more than 1 hop" do
      it "saves more than one" do
        lambda {
          post :create, good_params.deep_merge({:brew => {:hops_attributes => {"1" => hop, "2" => hop, "3" => hop }}})
        }.should change(Records::Hop, :count)
        expect(Records::Hop.count).to eq(3)
      end
    end

    context "with a blank name" do
      let(:bad_params) { good_params.deep_merge({:brew => {:name => ""}}) }

      it "does not create a brew record" do
        lambda {
          post :create, bad_params
        }.should_not change(Records::Brew, :count)
      end

      it "renders the new template" do
        post :create, bad_params
        expect(response).to render_template(:new)
      end

      it "assigns brew" do
        post :create, bad_params
        expect(assigns(:brew)).to_not be_nil
      end
    end
  end
end

