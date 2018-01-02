require 'rails_helper'

RSpec.describe "ITEMS API", type: :request do
  let!(:items) { create_list(:item, 100) }

  describe "GET /api/v1/items" do
    before { get '/api/v1/items' }
    it "returns 100 items" do
      expect(json).to_not be_empty
      expect(json.class).to be Array
      expect(json.length).to eq 100
    end

    it "returns HTTP status code 200" do
      expect(response).to have_http_status 200
    end
  end
end