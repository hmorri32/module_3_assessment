require 'rails_helper'

RSpec.describe BestBuyStore do
  let(:data) { { longName: "Cherry Creek Shopping Center",
                 city: "Denver",
                 distance: 3.45,
                 storeType: "Mobile SAS",
                 phone: "303-270-9189" } }

  let!(:best_buy) { BestBuyStore.new(data) }

  describe "initialize" do
    it "returns an instance" do
      expect(best_buy).to be_a(BestBuyStore)
    end

    it "has attributes" do
      expect(best_buy.long_name).to eq(data[:longName])
      expect(best_buy.city).to eq(data[:city])
      expect(best_buy.distance).to eq(data[:distance])
      expect(best_buy.store_type).to eq(data[:storeType])
      expect(best_buy.phone).to eq(data[:phone])
    end
  end
end