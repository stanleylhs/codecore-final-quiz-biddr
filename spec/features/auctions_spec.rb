require 'rails_helper'

RSpec.feature "Auctions", type: :feature do
  let(:user) { create(:user) }
  let(:user1) { create(:user) }
  describe "Auctions Listing" do
    it 'display a text "Recent Auctions"' do
      # visit is from capybara to type URL in address bar
      visit auctions_path
      # page is from capybara
      expect(page).to have_text "Auctions"
    end
    it "display a auction's title" do
      auction = create(:auction)
      visit auctions_path
      # with launchy gem
      # save_and_open_page
      # exact match vs /regex/i i to insensitive to case
      expect(page).to have_text(/#{auction.title}/i)
    end
  end
  # describe 'Adding a bid' do
  #   it 'updates the page with the new bid' do
  #     auction = create(:auction, {user_id: user1.id})
  #     page.set_rack_session(user_id: user.id)
  #     visit auction_path(auction)
  #     # bid_price = auction.reserve_price + 100
  #     fill_in 'price', with: '101'
  #     click_button "Bid"
  #     # reload_page
  #     # save_and_open_page
  #     expect(page).to have_text("101")
  #   end
  # end
end
