class Event < ApplicationRecord
  belongs_to :room
  scope :upcoming, -> { where("date >= ?", Date.today).or(where("date = ? AND start_time >= ?", Date.today, Time.current)) }
  has_many :tickets, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :tickets

  validate :check_event_seats, :check_event_price

  def check_event_seats
    if seats_left <= 0
      errors.add(:base, "Seats Left cannot be negative.")
    end
  end

  def check_event_price
    if price <= 0
      errors.add(:base, "Price cannot be negative.")
    end
  end
end
