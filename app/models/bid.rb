class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction

  validates_with Validators::CannotBidOwnAuction
  validates_with Validators::HigherBid

  delegate :full_name, to: :user, prefix: true, allow_nil: :true

  def formatted_bid_time
    created_at.strftime('%c')
  end

  delegate :reserve_price_text, to: :auction
end


