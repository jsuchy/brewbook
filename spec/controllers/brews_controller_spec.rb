require 'spec_helper'

describe BrewsController do
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
end

