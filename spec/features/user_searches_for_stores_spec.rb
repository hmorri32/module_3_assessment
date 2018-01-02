require "rails_helper"

RSpec.feature "User uses the search bar" do
  before { create_list(:item, 3); visit "/" }
  scenario "fills it in with 80202. clicks search" do

    save_and_open_page
  end
end