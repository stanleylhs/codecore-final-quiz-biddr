# t.string   "title"
# t.text     "details"
# t.datetime "ends_on"
# t.integer  "reserve_price"
# ref user


class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates :title, :details, :reserve_price, presence: true

  delegate :full_name, to: :user, prefix: true, allow_nil: :true


  include AASM

  # whiny_transitions will throw exception for invalid transition and we stop it by setting to false
  aasm whiny_transitions: false do # default column: aasm_state
    state :draft, initial: true
    state :published
    state :reserve_met
    state :won
    state :cancelled
    state :reserve_not_met
    # Link them by event

    event :publish do
      transitions from: :draft, to: :published
    end
    event :cancel do
      transitions from: [:draft, :published, :reserve_met], to: :cancelled
    end 
    event :met do
      transitions from: :published, to: :reserve_met
    end
    event :not_met do
      transitions from: :published, to: :reserve_not_met
    end
    event :success do
      transitions from: :reserve_met, to: :won
    end
  end


  def published
    where(aasm_state: :published)
  end

  def update_state
    self.met! if current_price > reserve_price
  end

  def current_price
    bids.count > 0 ? bids.last.price : 0
  end

  # TODO: Use state
  def reserve_price_text
    self.reserve_met? ? "Reserve price have been met." : "Reserve Price haven't been met."
  end
end
