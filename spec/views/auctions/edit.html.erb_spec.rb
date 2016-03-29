require 'rails_helper'

RSpec.describe "auctions/edit", type: :view do
  before(:each) do
    @auction = assign(:auction, Auction.create!(
      :title => "MyString",
      :details => "MyText",
      :ends_on => "MyString",
      :reserve_price => "MyString",
      :current_price => "MyString"
    ))
  end

  it "renders the edit auction form" do
    render

    assert_select "form[action=?][method=?]", auction_path(@auction), "post" do

      assert_select "input#auction_title[name=?]", "auction[title]"

      assert_select "textarea#auction_details[name=?]", "auction[details]"

      assert_select "input#auction_ends_on[name=?]", "auction[ends_on]"

      assert_select "input#auction_reserve_price[name=?]", "auction[reserve_price]"

      assert_select "input#auction_current_price[name=?]", "auction[current_price]"
    end
  end
end
