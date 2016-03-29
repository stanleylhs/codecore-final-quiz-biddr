class Validators::CannotBidOwnAuction < ActiveModel::Validator

  def validate(record)
    unless record.user != record.auction.user
      record.errors[:user_id] << "You can't bid on your own auction!"
      # record.idea.errors[:user_id] << "You can't like your own idea!"
    end
  end

end
