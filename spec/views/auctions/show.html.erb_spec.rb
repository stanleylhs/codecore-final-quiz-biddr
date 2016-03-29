require 'rails_helper'

RSpec.describe "auctions/show", type: :view do
  before(:each) do
    @auction = assign(:auction, Auction.create!(
      :title => "Title",
      :details => "MyText",
      :ends_on => "Ends On",
      :reserve_price => "Reserve Price",
      :current_price => "Current Price"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Ends On/)
    expect(rendered).to match(/Reserve Price/)
    expect(rendered).to match(/Current Price/)
  end
end
