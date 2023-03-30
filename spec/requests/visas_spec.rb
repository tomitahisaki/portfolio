require 'rails_helper'

RSpec.describe "Visas", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/visas/show"
      expect(response).to have_http_status(:success)
    end
  end

end
