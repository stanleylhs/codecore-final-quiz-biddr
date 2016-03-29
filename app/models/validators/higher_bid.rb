class Validators::HigherBid < ActiveModel::Validator

  def validate(record)
    unless record.price > record.auction.current_price
      record.errors[:price] << "You must bid higher than the current price!"
      # record.idea.errors[:user_id] << "You can't like your own idea!"
    end
  end

end
