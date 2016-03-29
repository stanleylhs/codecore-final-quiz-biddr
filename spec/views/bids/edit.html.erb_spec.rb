require 'rails_helper'

RSpec.describe "bids/edit", type: :view do
  before(:each) do
    @bid = assign(:bid, Bid.create!(
      :price => 1,
      :user => nil,
      :auction => nil
    ))
  end

  it "renders the edit bid form" do
    render

    assert_select "form[action=?][method=?]", bid_path(@bid), "post" do

      assert_select "input#bid_price[name=?]", "bid[price]"

      assert_select "input#bid_user_id[name=?]", "bid[user_id]"

      assert_select "input#bid_auction_id[name=?]", "bid[auction_id]"
    end
  end
end
