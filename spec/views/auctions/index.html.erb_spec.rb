require 'rails_helper'

RSpec.describe "auctions/index", type: :view do
  before(:each) do
    assign(:auctions, [
      Auction.create!(
        :title => "Title",
        :details => "MyText",
        :ends_on => "Ends On",
        :reserve_price => "Reserve Price",
        :current_price => "Current Price"
      ),
      Auction.create!(
        :title => "Title",
        :details => "MyText",
        :ends_on => "Ends On",
        :reserve_price => "Reserve Price",
        :current_price => "Current Price"
      )
    ])
  end

  it "renders a list of auctions" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Ends On".to_s, :count => 2
    assert_select "tr>td", :text => "Reserve Price".to_s, :count => 2
    assert_select "tr>td", :text => "Current Price".to_s, :count => 2
  end
end
