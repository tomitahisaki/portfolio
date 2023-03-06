require 'rails_helper'

RSpec.describe "PlanCountries", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/plan_countries/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/plan_countries/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/plan_countries/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/plan_countries/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/plan_countries/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/plan_countries/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
