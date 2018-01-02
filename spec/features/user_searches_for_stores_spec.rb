require "rails_helper"

RSpec.feature "User uses the search bar" do
  before { create_list(:item, 10); visit "/"; fill_in 'zip_code', with: 80202; click_on "Search" }

  describe "fills it in with 80202. clicks search" do
    it "my path should be /search" do
      expect(current_path).to eq('/search')
    end

    it "I should see a list of stores within 25 miles of 80202" do
      expect(page).to have_content("All stores within 25 miles of 80202")
    end
  end
end