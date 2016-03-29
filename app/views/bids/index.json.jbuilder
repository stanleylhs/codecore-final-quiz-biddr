json.array!(@bids) do |bid|
  json.extract! bid, :id, :price, :user_id, :auction_id
  json.url bid_url(bid, format: :json)
end
