require 'rails_helper'

RSpec.describe BestBuyService do
  let!(:best_buy) { BestBuyService.new }

  describe "initialize" do
    it "returns an instance" do
      expect(best_buy).to be_a(BestBuyService)
    end
  end

  describe "instance methods" do
  end
end