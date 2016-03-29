class Auctions::PublishAuction
  include Virtus.model
  attribute :auction, Auction
  def call
    auction.publish!
  end

end
