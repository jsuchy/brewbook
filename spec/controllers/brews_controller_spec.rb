require 'spec_helper'
require 'rails_helper'
require 'brews_controller'

describe BrewsController do
  describe "#new" do
    it "displays the :new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "asigns a new recipe variable" do
      get :new
      expect(assigns(:brew)).to be_new
    end
  end
end

