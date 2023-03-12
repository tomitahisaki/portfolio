require 'rails_helper'

RSpec.describe 'Countries', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/countries/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/countries/create'
      expect(response).to have_http_status(:success)
    end
  end
end
