require 'rails_helper'

RSpec.describe BestBuyService do
  let!(:best_buy) { BestBuyService.new }

  describe "initialize" do
    it "returns an instance" do
      expect(best_buy).to be_a(BestBuyService)
    end
  end

  describe "instance methods" do
    describe ".stores_within_25_miles" do
      it "should return all stores within a 25 mile radius of zip code" do
        stuff = best_buy.stores_within_25_miles
        expect(stuff.length).to eq(17)
      end
    end
  end
end