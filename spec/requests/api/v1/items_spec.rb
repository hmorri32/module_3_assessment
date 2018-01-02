require 'rails_helper'

RSpec.describe "ITEMS API", type: :request do
  let!(:items)  { create_list(:item, 100) }
  let(:item_id) { items.first.id }

  describe "GET /api/v1/items" do
    before { get '/api/v1/items' }
    it "returns 100 items,, does not include created/updated at" do
      expect(json).to_not be_empty
      expect(json.class).to be Array
      expect(json.length).to eq 100
      expect(json.first[:created_at]).to be_nil
      expect(json.first[:updated_at]).to be_nil
    end

    it "returns HTTP status code 200" do
      expect(response).to have_http_status 200
    end
  end

  describe "GET /api/v1/items/:id" do
    before { get "/api/v1/items/#{item_id}" }
    context "for a valid resource" do
      it "returns an item by item, does not include created/updated at" do
        expect(json).to_not be_empty
        expect(json['id']).to eq(1)
        expect(json['name']).to eq(items.first.name)
        expect(json['created_at']).to be_nil
        expect(json['updated_at']).to be_nil
      end

      it "returns HTTP status code 200" do
        expect(response).to have_http_status 200
      end
    end

    context "for an invalid resource" do
      let(:item_id) { 0 }

      it "returns an error message" do
        expect(response.body).to match /Couldn't find Item/
      end

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
    end
  end
end