require "rails_helper"

RSpec.feature "User uses the search bar" do
  before { create_list(:item, 10); visit "/"; fill_in 'zip_code', with: 80202; }

  describe "fills it in with 80202. clicks search" do
    it "my path should be /search" do
      VCR.use_cassette('user_searches/path_changes', :match_requests_on => [:method]) do
        click_on "Search"
        expect(current_path).to eq('/search')
      end
    end

    it "I should see a list of stores within 25 miles of 80202, paginated" do
      VCR.use_cassette('user_searches/sees_stores', :match_requests_on => [:method]) do
        click_on "Search"
        expect(page).to have_content("All stores within 25 miles of 80202")
        expect(page).to have_content("17 Total Stores")
        expect(page).to have_content("Cherry Creek Shopping Center")
        expect(page).to have_content("Belmar")
        expect(page).to have_content("Colorado Blvd")
        expect(page).to have_selector('.store-name', count: 10)
        expect(page).to have_selector('.next_page')
      end
    end

    it "should paginate results and be navigable" do
      VCR.use_cassette('user_searches/sees_pagination', :match_requests_on => [:method]) do
        click_on 'Search'

        expect(page).to have_content("17 Total Stores")
        expect(page).to have_selector('.store-name', count: 10)
        expect(page).to have_selector('.next_page')
        expect(page).to have_selector('.previous_page.disabled')

        click_on 'Next'

        expect(page).to have_selector('.store-name', count: 7)
        expect(page).to have_selector('.next_page.disabled')
        expect(page).to have_current_path("/search?commit=Search&page=2&utf8=✓&zip_code=80202")
      end
    end
  end
end