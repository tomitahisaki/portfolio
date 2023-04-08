require 'rails_helper'

RSpec.describe "Budgets", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/budgets/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/budgets/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/budgets/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/budgets/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/budgets/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
