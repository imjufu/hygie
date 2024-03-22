require 'rails_helper'

RSpec.describe "MacroCalculators", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/macro_calculator/index"
      expect(response).to have_http_status(:success)
    end
  end

end
