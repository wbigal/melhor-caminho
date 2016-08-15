require 'rails_helper'

RSpec.describe TraceRoutesController, type: :controller do
  describe "GET index" do
    it "render index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  describe "POST create" do
    it "creates route" do
      expect {
        process :create, method: :post, params: { lat: -23.5507845, lng: -46.6338611 }
      }.to change(Way, :count).by(1)
    end
  end
end
