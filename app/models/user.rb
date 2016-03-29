class User < ActiveRecord::Base
  has_secure_password

  has_many :auctions, dependent: :destroy
  has_many :bids, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end

  def bids_on_auctions
    bids.includes(:auction).references(:auction)
  end
end
